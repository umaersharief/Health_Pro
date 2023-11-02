import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class Iconcontainer extends StatelessWidget {
  const Iconcontainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.only(right: 20),
          width: 30.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColors.dividercolor),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20.sp,
            color: AppColors.cardcolor,
          ),
        ));
  }
}
