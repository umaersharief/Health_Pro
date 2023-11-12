import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/view/Mypassword/components/changepasscomp1.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';

import '../../utils/app_colors.dart';
import '../widgets/widgets/custom_text.dart';
import 'View/change_password.dart';

class MyPasswordScreen extends StatefulWidget {
  const MyPasswordScreen({super.key});

  @override
  State<MyPasswordScreen> createState() => _MyPasswordScreenState();
}

class _MyPasswordScreenState extends State<MyPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleappbar(text: 'My Password'),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              customTextRegular(
                  title: 'Password',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cardcolor),
              SizedBox(
                height: 16.h,
              ),
              Changepasscomp1(
                title: 'Password Change',
                onTap: () {
                  Get.to(() => ChangePassword());
                },
              ),
              // Changepasscomp1(title: 'Two Step Verfication'),
              Changepasscomp1(title: 'Save information', isradio: true),
            ],
          ),
        ),
      ),
    );
  }
}
