
import 'package:flutter/material.dart';
import 'package:splyshechka/widgets/switchers/pick_option/background_option.dart';
import 'package:splyshechka/widgets/switchers/pick_option/highlight_option.dart';
import 'package:splyshechka/widgets/switchers/pick_option/pick_option.dart';

class OptionCreator extends StatelessWidget {
  const OptionCreator({
    super.key,
    required this.optionStyle,
    required this.value,
    required this.isActive,
  });

  final OptionStyle optionStyle;
  final String value;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    switch (optionStyle) {
      case OptionStyle.highlightStyle:
        return HighlightOption(
          value: value,
          isActive: isActive,
        );
      case OptionStyle.backgroundStyle:
        return BackgroundOption(
          value: value,
          isActive: isActive,
        );
      default:
        return Text(value);
    }
  }
}
