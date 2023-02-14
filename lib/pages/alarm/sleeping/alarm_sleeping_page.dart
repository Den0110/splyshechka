import 'package:auto_route/auto_route.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_icons.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/options_list/value_element.dart';
import 'package:splyshechka/widgets/sleep_container/sleep_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/alarm/sleeping/bloc/alarm_sleeping_cubit.dart';
import 'package:splyshechka/pages/alarm/sleeping/widgets/sound_listener.dart';
import 'package:splyshechka/utils/one_shot_bloc.dart';
import 'dart:async';

class AlarmSleepingPage extends StatefulWidget {
  const AlarmSleepingPage({super.key});

  @override
  State<AlarmSleepingPage> createState() => _AlarmSleepingPageState();
}

class _AlarmSleepingPageState extends State<AlarmSleepingPage> {
  bool _isRecording = false;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  late NoiseMeter _noiseMeter;
  int db = 0;
  List<int> dbArr = [];

  @override
  void initState() {
    super.initState();
    _noiseMeter = NoiseMeter(onError);
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  int counter = 0;
  void onData(NoiseReading noiseReading) {
    setState(() {
      if (!_isRecording) {
        _isRecording = true;
      }
    });
    db = noiseReading.meanDecibel.round();
    counter += 1;
    if (counter % 100 == 0) dbArr.add(db);
  }

  void onError(Object error) {
    _isRecording = false;
  }

  void start() async {
    try {
      _noiseSubscription = _noiseMeter.noiseStream.listen(onData);
    } catch (err) {}
  }

  void stop() async {
    try {
      if (_noiseSubscription != null) {
        _noiseSubscription!.cancel();
        _noiseSubscription = null;
      }
      setState(() {
        _isRecording = false;
      });
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AlarmSleepingCubit>(),
      child: OneShotBlocConsumer<AlarmSleepingCubit, AlarmSleepingState>(
        listener: (context, state) {
          if (state is NavToResults) {
            context.router.navigate(const AlarmResultRoute());
          } else if (state is NavToAlarm) {
            context.router.navigate(const AlarmSettingsRoute());
          }
        },
        builder: (context, state) {
          return state.maybeWhen(
            initial: (currentDate, alarmTime, currentVolume) {
              currentVolume = db;
              String dateString = DateFormat("EEEE, MMM d").format(currentDate);
              String timeString =
                  DateFormat(DateFormat.HOUR24_MINUTE).format(currentDate);
              return Scaffold(
                body: Column(
                  children: [
                    SizedBox(
                      height: 77.h,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: timeString,
                            style: AppTextStyles.alarmNumber.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Text(
                      dateString,
                      style: AppTextStyles.alarmSubtitle.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 41.w),
                      child: SleepContainer(
                        child: ValueElement(
                          title: "Будильник",
                          isActive: true,
                          value: alarmTime,
                          onTap: () {
                            context.read<AlarmSleepingCubit>().alarmClicked();
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 115.h,
                    ),
                    SoundListener(
                      waveHeight: currentVolume.toDouble() / 7,
                    ),
                    SizedBox(
                      height: 120.h,
                    ),
                    SvgPicture.asset(
                      AppIcons.mic,
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    SizedBox(
                      height: 45.h,
                    ),
                    LargeButton(
                        text: _isRecording
                            ? 'Громкость в дб: $db'
                            : 'Начать запись',
                        onPressed: _isRecording? stop: start),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      child: LargeButton(
                        text: "Проснуться",
                        textColor: AppColors.black,
                        backgroundColor: AppColors.white,
                        shadowColor: AppColors.black,
                        onPressed: () {
                          context.read<AlarmSleepingCubit>().wakeUpClicked();
                          stop;
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: Container.new,
          );
        },
      ),
    );
  }
}
