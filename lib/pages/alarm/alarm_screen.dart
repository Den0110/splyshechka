import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

class ExampleAlarmRingPage extends StatelessWidget {

  const ExampleAlarmRingPage({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "You alarm  is ringing...",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text("🔔", style: TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    final now = DateTime.now();
                    // Alarm.set(
                    //   alarmSettings: alarmSettings.copyWith(
                    //     dateTime: DateTime(
                    //       now.year,
                    //       now.month,
                    //       now.day,
                    //       now.hour,
                    //       now.minute,
                    //       0,
                    //       0,
                    //     ).add(const Duration(minutes: 1)),
                    //   ),
                    // ).then((_) => Navigator.pop(context));
                  },
                  child: Text(
                    "Snooze",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                //    Alarm.stop(alarmSettings.id)
                //        .then((_) => Navigator.pop(context));
                  },
                  child: Text(
                    "Stop",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}