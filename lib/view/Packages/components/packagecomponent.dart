import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Tablepage/table1.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:slide_action/slide_action.dart';

// ignore: must_be_immutable
class MyWidget extends StatelessWidget {
  bool haverow;
  Color color;
  String rowtitle1, rowtitle2;
  MyWidget({
    super.key,
    this.color = AppColors.dividercolor,
    this.haverow = false,
    this.rowtitle1 = '',
    this.rowtitle2 = '',
  });

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      trackBuilder: (context, state) {
        return Container(
          padding: EdgeInsets.only(right: 30),
          decoration: BoxDecoration(
            color: color,
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFC2C2C2),
                width: 1.0,
              ),
            ),
          ),
          child: haverow == false
              ? Container(
                  alignment: Alignment.centerRight,
                  child: customTextRegular(
                    title: 'Quantity',
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackb1,
                  ))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Container()),
                    customTextRegular(
                      title: rowtitle1,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackb1,
                    ),
                    Expanded(child: Container()),
                    customTextRegular(
                      title: rowtitle2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackb1,
                    ),
                  ],
                ),
        );
      },
      thumbBuilder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            // Show loading indicator if async operation is being performed
            child: state.isPerformingAction
                ? const CupertinoActivityIndicator(
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
          ),
        );
      },
      action: () async {
        // Async operation
        await Future.delayed(
          const Duration(seconds: 1),
          () => Get.to(() => Table1()),
        );
      },
    );
  }
}
