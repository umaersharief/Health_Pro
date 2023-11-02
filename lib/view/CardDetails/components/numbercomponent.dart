import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Numbercomponent extends StatelessWidget {
  String text;
  Numbercomponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 25.h,
      width: 25.h,
      decoration: BoxDecoration(
        color: AppColors.dividercolor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: text != ''
            ? customTextRegular(
                title: text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
                color: AppColors.cardcolor,
              )
            : Icon(
                Icons.play_arrow,
                color: AppColors.cardcolor,
              ),
      ),
    );
  }
}
