import 'package:flutter/material.dart';
import 'package:my_pillow/utils/app_colors.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Articles',
        style: TextStyle(color: AppColors.white),
      ),
    );
  }
}
