import 'package:flutter/material.dart';
import 'sleep_color_picker_button.dart';

class SleepColorPicker extends StatelessWidget {
  final Color selectedColor;
  final Function(Color) onSelected;
  final List<Color> values;
  const SleepColorPicker({
    Key? key,
    required this.values,
    required this.selectedColor,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      children: values
          .map((elem) => SleepColorPickerButton(
                color: elem,
                isSelected: elem == selectedColor,
                onTap: () {
                  if (selectedColor != elem) {
                    onSelected(elem);
                  }
                },
              ))
          .toList(),
    );
  }
}
