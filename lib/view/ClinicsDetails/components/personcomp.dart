import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Personcomp extends StatelessWidget {
  String path;
  Personcomp({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 102.w,
      height: 171.h,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.dividercolor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                size: 15.sp,
                color: Colors.amber,
              ),
              SizedBox(
                width: 3.w,
              ),
              customTextRegular(
                title: '6.7',
                fontSize: 12.sp,
                color: AppColors.blackb3,
                fontWeight: FontWeight.w400,
              ),
              Expanded(
                child: Icon(
                  CupertinoIcons.heart,
                  size: 15.sp,
                ),
              )
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage(AppImages.person3),
            radius: 25,
          ),
          customTextRegular(
            title: 'John Doe',
            fontSize: 14.sp,
            color: AppColors.blackb3,
            fontWeight: FontWeight.w400,
          ),
          customTextRegular(
            title: '\$20.00 Hr',
            fontSize: 12.sp,
            color: AppColors.blackb3,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
