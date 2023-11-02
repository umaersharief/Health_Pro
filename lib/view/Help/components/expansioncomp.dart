import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Expansioncomp extends StatelessWidget {
  IconData? icon;
  String title;
  Expansioncomp({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: AppColors.blackb1,
      title: customTextRegular(
          title: title,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.blackb1),
      leading: Icon(
        icon,
        color: AppColors.cardcolor,
        size: 40.sp,
      ),
    );
  }
}
