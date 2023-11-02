import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/utils/app_colors.dart';

Widget customDivider({double width = 0, double height = 1}) {
  return Container(
    height: 1.h,
    width: width,
    color: AppColors.dividercolor,
  );
}
