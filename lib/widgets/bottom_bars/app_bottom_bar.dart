import 'package:flutter/material.dart';
import 'package:splyshechka/domain/models/bottom_bars/app_bottom_bar_items.dart';
import 'package:splyshechka/widgets/bottom_bars/app_bottom_bar_button.dart';

class AppBottomBar extends StatelessWidget {
  final AppBottomBarItem selected;
  final Function(AppBottomBarItem) onSelected;
  final List<AppBottomBarItem> values;

  const AppBottomBar({
    Key? key,
    required this.onSelected,
    required this.values,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: values
            .map(
              (elem) => AppBottomBarButton(
                icon: elem,
                isEnabled: selected == elem,
                onTap: () {
                  if (selected != elem) {
                    onSelected(elem);
                  }
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
