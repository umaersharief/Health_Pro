import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Servicecomponent extends StatelessWidget {
  String title, description, area, image;
  Servicecomponent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.area,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.symmetric(
        horizontal: 14.w,
      ),
      width: 344.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xFFDEEAFF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 118.w,
            height: 90.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 7.w,
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextRegular(
                  title: title,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cardcolor,
                ),
                SizedBox(
                  height: 9.h,
                ),
                customTextRegular(
                  title: description,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.redb3color,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppColors.cardcolor,
                      size: 15.sp,
                    ),
                    customTextRegular(
                      title: area,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cardcolor,
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
