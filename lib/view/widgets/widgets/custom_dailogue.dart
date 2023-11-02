import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  // const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        // padding: EdgeInsets.all(0),
        height: 17.73.h,
        width: 17.73.h,
        decoration: BoxDecoration(
            color: AppColors.blueb9, borderRadius: BorderRadius.circular(4)),
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 14.h,
              )
            : SizedBox(),
      ),
    );
  }
}
