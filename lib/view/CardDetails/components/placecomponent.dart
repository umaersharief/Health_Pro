import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Placecomponent extends StatelessWidget {
  String image, title, decription, address;
  double star;
  Placecomponent({
    Key? key,
    required this.star,
    required this.image,
    required this.title,
    required this.decription,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      margin: EdgeInsets.only(bottom: 8.h),
      width: 300.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.dividercolor,
      ),
      child: ListTile(
        leading: CircleAvatar(
          // backgroundImage: NetworkImage(image),
          radius: 30.r,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customTextRegular(
              title: title,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.cardcolor,
            ),
            customTextRegular(
              title: decription,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.redb3color,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: AppColors.cardcolor,
                  size: 15.sp,
                ),
                customTextRegular(
                  title: address,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.cardcolor,
                ),
              ],
            ),
            // Row(
            //   children: [
            //     RatingBar.builder(
            //       initialRating: star,
            //       minRating: 1,
            //       direction: Axis.horizontal,
            //       allowHalfRating: true,
            //       itemCount: 5,
            //       itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            //       itemBuilder: (context, _) => Icon(
            //         Icons.star,
            //         color: Colors.amber,
            //       ),
            //       onRatingUpdate: (value) {},
            //       itemSize: 15.sp,
            //     ),
            //     SizedBox(
            //       width: 3.w,
            //     ),
            //     customTextRegular(
            //       title: '4',
            //       fontSize: 14.sp,
            //       fontWeight: FontWeight.w400,
            //       color: AppColors.blackb3,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
