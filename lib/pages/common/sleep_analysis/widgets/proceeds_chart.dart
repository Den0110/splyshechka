import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SleepChart extends StatelessWidget {
  final List<int> data;
  final List<String> labels;

  SleepChart({
    Key? key,
    required this.data,
    required this.labels,
  }) : super(key: key);

  List<SplineAreaSeries<int, String>> _getDataSeries() {
    return <SplineAreaSeries<int, String>>[
      SplineAreaSeries<int, String>(
        dataSource: data,
        xValueMapper: (int price, int index) => labels[index],
        yValueMapper: (int price, _) => price,
        markerSettings: const MarkerSettings(isVisible: false),
        borderColor: const Color.fromRGBO(160, 230, 240, 1.0),
        borderDrawMode: BorderDrawMode.top,
        borderWidth: 1.r,
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.transparent,
            Color.fromRGBO(160, 230, 240, 1.0),
          ],
        ),
        // width: 1.r,
      ),
    ];
  }

  final labelsStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: AppColors.lightGrey,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 2.5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Awake', style: labelsStyle),
              Text('Light\nsleep', style: labelsStyle),
              Text('Deep\nsleep', style: labelsStyle),
              Text('Deep\nsleep',
                  style: labelsStyle.copyWith(color: Colors.transparent)),
              Text('Time', style: labelsStyle),
            ],
          ),
        ),
        SizedBox(
          width: 8.w,
        ),
        Expanded(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: const Color.fromRGBO(58, 55, 79, 1.0),
                      height: 1.r,
                    ),
                    Container(
                      color: const Color.fromRGBO(58, 55, 79, 1.0),
                      height: 1.r,
                    ),
                    Container(
                      color: const Color.fromRGBO(58, 55, 79, 1.0),
                      height: 1.r,
                    ),
                    Container(color: Colors.transparent, height: 1.r),
                    Container(color: Colors.transparent, height: 1.r),
                  ],
                ),
              ),
              SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                legend: Legend(isVisible: false),
                primaryXAxis: CategoryAxis(
                  maximumLabels: 12,
                  axisLabelFormatter: (AxisLabelRenderDetails details) {
                    return ChartAxisLabel(
                        (details.text == labels.first ? '          ' : '') +
                            details.text,
                        labelsStyle.copyWith(height: 10.h / 10.sp));
                  },
                  majorTickLines: const MajorTickLines(width: 0),
                  majorGridLines: const MajorGridLines(
                    width: 1,
                    dashArray: [1, 1],
                    color: AppColors.greyMain,
                  ),
                  labelPlacement: LabelPlacement.onTicks,
                ),
                primaryYAxis: NumericAxis(isVisible: false),
                enableAxisAnimation: true,
                trackballBehavior: TrackballBehavior(
                  enable: false,
                  activationMode: ActivationMode.singleTap,
                ),
                series: _getDataSeries(),
                tooltipBehavior: TooltipBehavior(enable: false),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
