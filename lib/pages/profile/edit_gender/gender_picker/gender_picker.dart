import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_pillow/models/gender/gender.dart';
import 'package:my_pillow/widgets/containers/sleep_container.dart';
import 'package:my_pillow/widgets/options_list/check_element.dart';

class GenderPicker extends StatelessWidget {
  final Function(Gender) onPressed;
  final Gender pickedValue;
  final List<Gender> values;
  const GenderPicker({
    Key? key,
    required this.pickedValue,
    required this.values,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SleepContainer(
      child: Column(
        children: values
            .map(
              (elem) => CheckElement(
                icon: SvgPicture.asset(elem.icon),
                title: elem.name,
                value: pickedValue == elem,
                isActive: true,
                onChanged: () {
                  onPressed(elem);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
