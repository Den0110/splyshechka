import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/pages/achievements/bloc/achievement_bloc.dart';
import 'package:splyshechka/pages/achievements/widgets/achievemenets_column_widget.dart';
import 'package:splyshechka/pages/achievements/widgets/achievement_dialog/achevement_get_dialog.dart';
import 'package:splyshechka/pages/achievements/widgets/page_indicator.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({Key? key}) : super(key: key);

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  late int selectedPage;

  @override
  void initState() {
    selectedPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AchievementBloc>()..add(const PageOpened()),
      child: BlocSideEffectConsumer<AchievementBloc, AchievementBloc,
          AchievementState, AchievementCommand>(
        bloc: getIt<AchievementBloc>(),
        listener: (context, state) {
          state.when(
            openDialog: ()  {
             print("blyat");
            },
          );
        },
        builder: (context, state) => state.loading
            ? Padding(
                padding: EdgeInsets.only(
                  top: 20.h,
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.purple,
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: AppColors.space,
                appBar: AppBar(
                  toolbarHeight: 10.h,
                  title: Container(
                    padding: EdgeInsets.only(bottom: 7.h),
                    height: 5.h,
                    child: PageIndicator(
                      index: selectedPage,
                      count: 2,
                    ),
                  ),
                ),
                body: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 16.w, left: 16.w, top: 9.h, bottom: 100.h),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Text(
                                "Полученные достижения",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppTextStyles.fontFamilyOpenSans,
                                  fontSize: 26.sp,
                                ),
                              ),
                            ),
                            AchievementsColumnWidget(
                              achievements: state.listReady,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: 16.w, left: 16.w, top: 9.h, bottom: 100.h),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Text(
                                "Неполученные достижения",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: AppTextStyles.fontFamilyOpenSans,
                                  fontSize: 26.sp,
                                ),
                              ),
                            ),
                            AchievementsColumnWidget(
                              achievements: state.listUnready,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
