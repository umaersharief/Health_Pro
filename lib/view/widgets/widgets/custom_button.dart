import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/app_colors.dart';

Widget customButton({
  double height = 46,
  double width = double.infinity,
  String text = "",
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w600,
  Color fontColor = Colors.black,
  Color color = AppColors.primaryblue,
  double borderRadius = 20,
  Function? ontap,
  bool ishide = false,
  String image = '',
  Color? spinkitcolor,
  bool? loading,
}) {
  return GestureDetector(
    onTap: () {
      ontap != null ? ontap() : () {};
    },
    child: Container(
        // margin: EdgeInsets.only(bottom:80 ),
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: color,
          // gradient: LinearGradient(
          //   colors: [Colors.blue, AppColors.lightgreen.withOpacity(0.50)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ishide
                ? Container(
                    padding: EdgeInsets.all(3.w),
                    height: 24.h,
                    width: 24.h,
                    decoration: const BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    child: SvgPicture.asset(image),
                  )
                : const SizedBox(),
            ishide
                ? SizedBox(
                    width: 21.w,
                  )
                : const SizedBox(),
            loading == true
                ? SpinKitCircle(
                    color: spinkitcolor,
                    size: 40.h,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      color: fontColor,
                    ),
                  ),
          ],
        )),
  );
}
