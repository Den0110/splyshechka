import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_pillow/models/notifications/notification_type.dart';
import 'package:my_pillow/utils/app_colors.dart';
import 'package:my_pillow/widgets/notifications/notification_without_image.dart';
import 'package:my_pillow/widgets/notifications/notifications_with_image.dart';

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
            NotificationWithIcon(
                subTitle: 'test',
                title: 'test',
                onPressed: () {},
                onClosed: () {},
                type: NotificationType.empty),
            NotificationWithIcon(
                subTitle: 'test',
                title: 'test',
                onPressed: () {},
                onClosed: () {},
                type: NotificationType.closeable),
            NotificationWithIcon(
                subTitle: 'test',
                title: 'test',
                onPressed: () {},
                onClosed: () {},
                type: NotificationType.openable),
            NotificationWithIcon(
                title: 'Notification Title',
                subTitle: 'Here’s notification text.',
                type: NotificationType.closeable,
                onPressed: () {},
                onClosed: () {}),
            NotificationWithOutImage(
                color: AppColors.darkPurple,
                title: 'test',
                onPressed: () {},
                onClosed: () {},
                type: NotificationType.empty),
            NotificationWithOutImage(
                color: AppColors.darkPurple,
                title: 'test',
                onPressed: () {},
                onClosed: () {},
                type: NotificationType.closeable),
            NotificationWithOutImage(
                color: AppColors.darkPurple,
                title: 'test',
                onPressed: () {},
                onClosed: () {},
                type: NotificationType.openable),
          ],
        ),
      ),
    );
  }
}
