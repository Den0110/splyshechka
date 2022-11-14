import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/widgets/buttons/circle_icon_button.dart';
import 'package:my_pillow/widgets/buttons/large_button.dart';
import 'package:my_pillow/widgets/buttons/small_button.dart';
import 'package:my_pillow/widgets/options_list/active_widget.dart';
import 'package:my_pillow/widgets/options_list/check_element.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';
import 'package:my_pillow/widgets/options_list/slider_element.dart';
import 'package:my_pillow/widgets/options_list/stepper_element.dart';
import 'package:my_pillow/widgets/options_list/switch_element.dart';
import 'package:my_pillow/widgets/options_list/value_element.dart';

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
            LargeButton(text: "text",backgroundColor: Colors.red, onPressed: () {}),
            SmallButton(text: "text",backgroundColor: Colors.red, onPressed: () {}),
            CircleIconButton(icon: Icon(Icons.abc), onPressed: () {}),
            ActiveWidget(isActive: true, child: Text('Test')),
            CheckElement(
                title: 'Test', isActive: true, value: true, onChanged: () {}),
            ListElement(isActive: true),
            SliderElement(
                isActive: true,
                value: 15.5,
                minValue: 1.0,
                maxValue: 20.0,
                onChanged: (a) {}),
            StepperElement(
                title: 'Test',
                isActive: true,
                value: 15,
                onIncrease: () {},
                onDecrease: () {}),
            SwitchElement(
                title: 'True', isActive: true, value: true, onChanged: (a) {}),
            ValueElement(title: 'Test', isActive: true),
          ],
        ),
      ),
    );
  }
}
