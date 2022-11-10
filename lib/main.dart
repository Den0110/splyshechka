import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/utils/app_icons.dart';
import 'package:my_pillow/widgets/indicators/circle_fill_indicator.dart';
import 'package:my_pillow/widgets/indicators/line_fill_indicator.dart';
import 'package:my_pillow/widgets/indicators/part_line_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return DefaultTextHeightBehavior(
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          child: MaterialApp(
            title: 'Сплюшечка',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const MyHomePage(),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сплюшечка'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CircleFillIndicator(
              maxValue: 50,
              minValue: 0,
              value: 24,
              text: '22',
              gradients: LinearGradient(
                colors: [
                  AppColors.peach,
                  AppColors.yellow,
                  AppColors.lightYellow,
                  AppColors.green,
                ],
              ),
            ),
            const CircleFillIndicator(
              maxValue: 50,
              minValue: 0,
              value: 0,
              text: '22',
            ),
            const CircleFillIndicator(
              maxValue: 50,
              minValue: 0,
              value: 44,
              text: '22',
            ),
            const CircleFillIndicator(
              maxValue: 50,
              minValue: 0,
              value: 30,
              text: '22',
            ),
            CircleFillIndicator(
              minValue: 100,
              maxValue: 200,
              value: 125,
              text: '22',
            ),
            CircleFillIndicator(
              minValue: 100,
              maxValue: 200,
              value: 125,
              unit: '%',
              indicatorRadius: 75.r,
              fontSizeText: 37.sp,
              widthIndicator: 17.r,
              fontSizeUntil: 22.sp,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: LineFillIndicator(
                maxValue: 200,
                minValue: 100,
                value: 125,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: LineFillIndicator(
                maxValue: 200,
                minValue: 100,
                value: 101,
                color: Color.fromRGBO(180, 180, 185, 1),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: LineFillIndicator(
                maxValue: 200,
                minValue: 100,
                value: 200,
                text: "Level 17",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: LineFillIndicator(
                maxValue: 200,
                minValue: 100,
                value: 125,
                text: "Level 17",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: LineFillIndicator(
                maxValue: 200,
                minValue: 100,
                value: 125,
                text: "Level 17",
                iconBorderRadius: 10,
                svgIconPath: AppIcons.alarm,
              ),
            ),
            const PartFillIndicator(
              activeParts: 0,
              parts: 7,
              text: 'Pillow Mint (0/7)',
            ),
            const SizedBox(
              height: 10,
            ),
            PartFillIndicator(
              activeParts: 3,
              parts: 7,
              text: 'Pillow Mint (4/7)',
            ),
          ],
        ),
      ),
    );
  }
}
