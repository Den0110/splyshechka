import 'package:flutter/material.dart';

abstract class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.isActive,
    required this.value,
    this.color,
  });

  final bool isActive;
  final String value;
  final Color? color;
}
