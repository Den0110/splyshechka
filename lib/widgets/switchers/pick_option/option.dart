import 'package:flutter/material.dart';

abstract class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.isActive,
    required this.value,
  });

  final bool isActive;
  final String value;
}
