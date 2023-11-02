import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Detailcomponent extends StatelessWidget {
  String title, subtitle;
  Detailcomponent({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: customTextRegular(
          title: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.dividercolor),
      subtitle: customTextRegular(
          title: subtitle,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xffA6C1FF)),
    );
  }
}
