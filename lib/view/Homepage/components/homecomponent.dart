import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_button.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Homecomponent extends StatelessWidget {
  bool ispackage;
  String image;
  String price;
  String title;
  Function ontap;
  Function()? imageonTap;
  Homecomponent({
    super.key,
    this.ispackage = false,
    required this.image,
    required this.title,
    required this.price,
    required this.ontap,
    required this.imageonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.h),
      width: 265.w,
      margin: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.cardcolor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: imageonTap,
            child: Container(
              height: 155.h,
              width: 250.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.r),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          ispackage == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customTextRegular(
                      title: title,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.dividercolor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customTextRegular(
                          title: 'Price',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.dividercolor,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        customTextRegular(
                          title: price,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.dividercolor,
                        ),
                      ],
                    ),
                  ],
                )
              : customTextRegular(
                  title: title,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.dividercolor,
                ),
          SizedBox(
            height: 15.h,
          ),
          customButton(
            width: 82.w,
            height: 25.h,
            borderRadius: 4.r,
            text: ispackage ? 'View Details' : 'Order Now',
            fontColor: AppColors.cardcolor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.dividercolor,
            ontap: ontap,
          ),
        ],
      ),
    );
  }
}
