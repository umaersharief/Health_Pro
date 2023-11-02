import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Cliniccomp1 extends StatelessWidget {
  IconData? icon;
  String text;
  Cliniccomp1({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.color1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.dividercolor,
            size: 20.sp,
          ),
          SizedBox(
            height: 3.h,
          ),
          customTextRegular(
            title: text,
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.dividercolor,
          ),
        ],
      ),
    );
  }
}
