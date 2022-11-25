import 'package:flutter/material.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';
import 'package:my_pillow/widgets/switchers/sleep_checkbox/sleep_checkbox.dart';

class CheckElement extends StatelessWidget {
  const CheckElement({
    super.key,
    required this.title,
    required this.isActive,
    required this.value,
    required this.onChanged,
    this.iconAsset,
    this.verticalPadding,
  });

  final String title;
  final bool isActive;
  final bool value;
  final VoidCallback onChanged;
  final String? iconAsset;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return ListElement(
      verticalPadding: verticalPadding,
      title: title,
      isActive: isActive,
      onTap: () {
        onChanged();
      },
      arrowIfTappable: false,
      iconAsset: iconAsset,
      rightPadding: 5.0,
      child: SleepCheckbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
