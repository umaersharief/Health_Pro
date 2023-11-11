import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Expansioncomp extends StatelessWidget {
  IconData? icon;
  String title;
  String answer;
  Expansioncomp({
    super.key,
    required this.title,
    this.icon,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: width * 0.185, right: width * 0.1, bottom: height * 0.03),
          child: customTextRegular(
              title: answer,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackb1),
        ),
      ],
    );
  }
}
