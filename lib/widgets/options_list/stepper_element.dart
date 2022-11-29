
import 'package:flutter/material.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';
import 'package:my_pillow/widgets/switchers/sleep_stepper/sleep_stepper.dart';

class StepperElement extends StatelessWidget {
  const StepperElement({
    super.key,
    required this.title,
    required this.isActive,
    required this.value,
    required this.onIncrease,
    required this.onDecrease,
    this.isActiveMinus = true,
    this.isActivePlus = true,
    this.icon,
    this.verticalPadding,
    this.iconSize,
  });

  final bool isActivePlus;
  final bool isActiveMinus;
  final String title;
  final bool isActive;
  final num value;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final Widget? icon;
  final double? verticalPadding;
  final Size? iconSize;

  @override
  Widget build(BuildContext context) {
    return ListElement(
      iconSize: iconSize,
      title: title,
      isActive: isActive,
      icon: icon,
      verticalPadding: verticalPadding,
      rightPadding: 2.0,
      child: SleepStepper(
        value: value,
        onIncrease: onIncrease,
        onDecrease: onDecrease,
        isActiveMinus: isActiveMinus,
        isActivePlus: isActivePlus,
      ),
    );
  }
}
