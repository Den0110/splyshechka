import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splyshechka/widgets/articles/big_white_button.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({required this.onPressed, Key? key}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/no_connection.svg'),
          SizedBox(
            height: 58.h,
          ),
          Text(
            "Refresh app",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              color: const Color(0xff5C5C5C),
            ),
          ),
          SizedBox(
            height: 66.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: BigWhiteButton(
              text: "Refresh app",
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
