import 'package:flutter/material.dart';
import 'package:my_pillow/utils/app_colors.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Statistics',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
