import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Healthcomp extends StatelessWidget {
  String status;
  Healthcomp({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(AppImages.pic1),
        radius: 30.r,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customTextRegular(
              title: 'Asian Medical Center',
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackb1),
          SizedBox(
            height: 3.h,
          ),
          customTextRegular(
              title: 'May 20, 2015',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff232323)),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
      subtitle: Row(
        children: [
          customTextRegular(
              title: 'Status: ',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff7B7B7B)),
          customTextRegular(
              title: status,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: status == 'Completed'
                  ? Color(0xff34A853)
                  : Color(0xffB00000)),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: AppColors.cardcolor),
    );
  }
}
