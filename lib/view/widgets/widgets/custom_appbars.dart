import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import 'custom_text.dart';

Widget customAppBar({
  String text = "",
}) {
  return Container(
    child: Column(
      children: [],
    ),
  );
}

PreferredSizeWidget simpleappbar(
    {required String text,
    isicon = true,
    double elevation = 4.0,
    Color backgorundcolor = AppColors.dividercolor}) {
  return AppBar(
    backgroundColor: backgorundcolor,
    elevation: elevation,
    centerTitle: true,
    title: customTextRegular(
        title: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blackb1),
    leading: isicon
        ? IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.blackb1,
              size: 25.sp,
            ))
        : null,
  );
}
