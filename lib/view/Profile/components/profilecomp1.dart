import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Profilecomp1 extends StatelessWidget {
  bool ficon;
  String text;
  IconData? icon;
  String image;
  Function ontap;
  Profilecomp1({
    super.key,
    this.ficon = true,
    required this.text,
    this.icon,
    this.image = '',
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        onTap: () => ontap(),
        leading: image == ''
            ? Icon(
                icon,
                color: AppColors.cardcolor,
                size: 25.sp,
              )
            : Image.asset(
                image,
                height: 25.h,
                width: 25.w,
              ),
        title: customTextRegular(
          title: text,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.cardcolor,
        ),
        trailing: ficon == true
            ? Icon(
                Icons.arrow_forward_ios,
                color: AppColors.cardcolor,
                size: 20.sp,
              )
            : Text(''),
      ),
    );
  }
}
