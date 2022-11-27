import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_pillow/widgets/articles/choice_chips.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListChipsSync extends StatefulWidget {
  static const int _defaultAnimDurationMs = 500;

  final GlobalKey<ChoiceChipsState> chipsKey;
  final Widget Function(
    ItemScrollController itemScrollController,
    ItemPositionsListener itemPositionsListener,
  ) listBuilder;
  final int itemsCount;
  final int initialSelectedItem;
  final double intermediateOffset;
  final double startOffset;
  final double? endOffset;
  final Duration animDuration;

  const ListChipsSync({
    Key? key,
    required this.chipsKey,
    required this.itemsCount,
    required this.listBuilder,
    this.initialSelectedItem = 0,
    this.intermediateOffset = 0.09,
    this.startOffset = 0,
    this.endOffset,
    this.animDuration = const Duration(milliseconds: _defaultAnimDurationMs),
  }) : super(key: key);

  @override
  State<ListChipsSync> createState() => ListChipsSyncState();
}

class ListChipsSyncState extends State<ListChipsSync> {
  int _currentPage = 0;
  bool isUserScrolling = false;

  final ItemScrollController _scrollController = ItemScrollController();
  final ItemPositionsListener _positionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    _currentPage = widget.initialSelectedItem;
    Future.delayed(
      widget.animDuration,
      () => onChipSelected(widget.initialSelectedItem),
    );
    _positionsListener.itemPositions.addListener(() {
      final visibleCards = _positionsListener.itemPositions.value.toList();
      if (visibleCards.isNotEmpty) {
        visibleCards.sort((a, b) => a.index.compareTo(b.index));
        int newIndex = visibleCards.first.index;
        for (var i = 1; i < visibleCards.length; i++) {
          // counts is the current card more visible on screen
          final isCloserToCenter = visibleCards[i].itemLeadingEdge <
              1 - visibleCards[i - 1].itemTrailingEdge;
          if (visibleCards[i].itemLeadingEdge > 0 && isCloserToCenter) {
            newIndex = visibleCards[i].index;
          }
        }
        if (_currentPage != newIndex && isUserScrolling) {
          _currentPage = newIndex;
          widget.chipsKey.currentState?.selectItem(newIndex);
        }
      }
    });
    super.initState();
  }

  void onChipSelected(int index) {
    isUserScrolling = false;
    widget.chipsKey.currentState?.selectItem(index);
    var align = widget.intermediateOffset;
    if (index == 0) {
      align = widget.startOffset;
    }
    if (index == widget.itemsCount - 1 && widget.endOffset != null) {
      align = widget.endOffset!;
    }
    _scrollController.scrollTo(
      index: index,
      duration: widget.animDuration,
      curve: Curves.ease,
      alignment: align,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        isUserScrolling = notification.direction != ScrollDirection.idle;
        return false;
      },
      child: widget.listBuilder(_scrollController, _positionsListener),
    );
  }
}
