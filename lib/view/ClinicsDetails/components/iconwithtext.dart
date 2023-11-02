import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Iconwithtext extends StatelessWidget {
  IconData? icon;
  String text;
  Iconwithtext({super.key, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.cardcolor,
      ),
      title: customTextRegular(
        title: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.blackb1,
      ),
    );
  }
}
