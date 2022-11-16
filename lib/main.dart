import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/widgets/options_list/active_widget.dart';
import 'package:my_pillow/widgets/options_list/check_element.dart';
import 'package:my_pillow/widgets/options_list/list_element.dart';
import 'package:my_pillow/widgets/options_list/slider_element.dart';
import 'package:my_pillow/widgets/options_list/stepper_element.dart';
import 'package:my_pillow/widgets/options_list/switch_element.dart';
import 'package:my_pillow/widgets/options_list/value_element.dart';
import 'package:my_pillow/widgets/switchers/pick_option/background_option.dart';
import 'package:my_pillow/widgets/switchers/pick_option/highlight_option.dart';
import 'package:my_pillow/widgets/switchers/pick_option/option_creator.dart';
import 'package:my_pillow/widgets/switchers/pick_option/pick_option.dart';
import 'package:my_pillow/widgets/switchers/question_button/question_button.dart';

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
            const ActiveWidget(isActive: true, child: Text('Test')),
            CheckElement(title: 'Test', isActive: true, value: true , onChanged:(){}),
            const ListElement(isActive: true),
            SliderElement(isActive: true, value: 15.5, minValue: 1.0, maxValue: 20.0, onChanged: (a){}),
            StepperElement(title: 'Test', isActive: true, value: 15, onIncrease: (){}, onDecrease: (){}),
            SwitchElement(title: 'True', isActive: true, value: true, onChanged: (a){}),
            const ValueElement(title: 'Test', isActive: true),
            const BackgroundOption(isActive: true, value: 'test'),
            const HighlightOption(isActive: true, value: 'test'),
            const OptionCreator(optionStyle: OptionStyle.highlightStyle, value: 'test', isActive: true),
            PickOption(options: ['test'], active: 1, optionStyle: OptionStyle.highlightStyle, onTap: (a){}),
            QuestionButton(onTap: (){}),
          ],
        ),
      ),
    );
  }
}
