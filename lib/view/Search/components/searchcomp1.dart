import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Searchcomp1 extends StatelessWidget {
  String image;
  String title;
  String description;
  String review;
  double rating;
  Searchcomp1(
      {super.key,
      required this.image,
      required this.rating,
      required this.title,
      required this.description,
      required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344.w,
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.dividercolor,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(4, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 88.w,
            height: 88.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.black),
                SizedBox(
                  height: 9.h,
                ),
                customTextRegular(
                    title: description,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyg1),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20.sp,
                      ),
                      onRatingUpdate: (value) {},
                      itemSize: 15.sp,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    customTextRegular(
                      title: review,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackb3,
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
