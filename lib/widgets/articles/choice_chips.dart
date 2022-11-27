import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class ChoiceChips extends StatefulWidget {
  final List<String> titles;
  final int initialValue;
  final void Function(int) onTap;
  final bool isScrollable;

  const ChoiceChips({
    Key? key,
    required this.titles,
    required this.initialValue,
    required this.onTap,
    this.isScrollable = true,
  }) : super(key: key);

  @override
  State<ChoiceChips> createState() => ChoiceChipsState();
}

class ChoiceChipsState extends State<ChoiceChips> {
  static const int _animDurationMs = 500;

  final ItemScrollController _chipsScrollController = ItemScrollController();

  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.initialValue;
    super.initState();
  }

  void selectItem(int index) {
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
      });
      _chipsScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: _animDurationMs),
        curve: Curves.ease,
        alignment: 0.5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ScrollablePositionedList.builder(
        physics:
            widget.isScrollable ? null : const NeverScrollableScrollPhysics(),
        itemScrollController: _chipsScrollController,
        itemCount: widget.titles.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          final title = widget.titles[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24.w : 0,
              right: index == widget.titles.length - 1 ? 24.w : 5.w,
            ),
            child: CustomChoiceChip(
              title: title,
              selected: selectedIndex == index,
              onTap: () {
                widget.onTap(index);
              },
            ),
          );
        }),
      ),
    );
  }
}

class CustomChoiceChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CustomChoiceChip({
    required this.title,
    required this.selected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 40.h,
          margin: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: selected ? Colors.black.withOpacity(0.38) : Colors.transparent,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sm,
                  height: 15.6.h / 12.sm,
                  color: selected ? Colors.white : Colors.black.withOpacity(0.38),
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
