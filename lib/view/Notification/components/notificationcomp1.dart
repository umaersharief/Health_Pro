import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/widgets/custom_text.dart';

// ignore: must_be_immutable
class Notificationscomp1 extends StatelessWidget {
  String title;
  IconData? icon;
  Notificationscomp1({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xffF5F5F5),
        child: Icon(
          icon,
          size: 40.sp,
          color: AppColors.cardcolor,
        ),
      ),
      title: customTextRegular(
          title: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.blackb1),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            CupertinoIcons.calendar,
            size: 16.sp,
          ),
          SizedBox(
            width: 8.w,
          ),
          customTextRegular(
              title: '2 Feb, 2021',
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff747474)),
        ],
      ),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
    );
  }
}
