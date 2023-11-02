import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Myrow extends StatelessWidget {
  Myrow({super.key, required this.icon, required this.text});
  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.dividercolor,
          size: 10.sp,
        ),
        SizedBox(
          width: 2.w,
        ),
        customTextRegular(
          title: text,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xffECEFF2),
        ),
      ],
    );
  }
}
