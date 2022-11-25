
import 'package:flutter/material.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';
import 'package:my_pillow/widgets/switchers/sleep_switch/sleep_switch.dart';

class SwitchElement extends StatelessWidget {
  const SwitchElement({
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
  final void Function(bool) onChanged;
  final String? iconAsset;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return ListElement(
      verticalPadding: verticalPadding,
      title: title,
      isActive: isActive,
      iconAsset: iconAsset,
      onTap: () {
        onChanged(!value);
      },
      arrowIfTappable: false,
      child: SleepSwitch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
