import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Changepasscomp1 extends StatelessWidget {
  int? selectedoption;
  String title;
  bool isradio;
  void Function()? onTap;
  Changepasscomp1(
      {super.key, this.onTap, required this.title, this.isradio = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
          title: customTextRegular(
              title: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackb1),
          trailing: isradio
              ? Container(
                  width: 25.w,
                  child: Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: AppColors.cardcolor,
                    onChanged: (value) {},
                  ),
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  size: 20.sp,
                  color: Color(0xff747474),
                )),
    );
  }
}
