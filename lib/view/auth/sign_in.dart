import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/auth/Login/Provider/login_provider.dart';
import 'package:health_pro/view/auth/Login/View/login_view.dart';
import 'package:health_pro/view/auth/Register/View/register_view.dart';
import 'package:health_pro/view/widgets/widgets/custom_divider.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets/custom_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 457.h,
              width: Get.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/doctor_image.png",
                    ),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 130.h,
                      width: Get.width,
                      decoration: BoxDecoration(
                          // color: Colors.white.withOpacity(0.50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(2.w, 2.h),
                              spreadRadius: 30.r,
                              blurRadius: 40.r,
                            )
                          ]),
                    ),
                  ),
                  Positioned(
                      bottom: 38.h,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/icons/HealthPro-Logo-1 1.png",
                        height: 98.h,
                        width: 247.w,
                      )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 17.h,
                  ),
                  customButton(
                      width: 327.w,
                      text: "Sign in with Email",
                      fontColor: Colors.white,
                      ontap: () {
                        Get.to(() => Login());
                      }),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: customDivider(height: 1.h, width: Get.width)),
                      SizedBox(
                        width: 16.w,
                      ),
                      customTextRegular(
                          title: "or",
                          fontSize: 16.h,
                          color: AppColors.grey75,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                          child: customDivider(height: 1.h, width: Get.width)),
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  customButton(
                      width: 327.w,
                      text: "Continue with Google",
                      fontColor: Colors.white,
                      color: Colors.red,
                      image: "assets/icons/Frame (1).svg",
                      ishide: true,
                      ontap: () {
                        Provider.of<LogInProvider>(context, listen: false)
                            .signInWithGoogle(context);
                      }),
                  SizedBox(
                    height: 12.h,
                  ),
                  customButton(
                      width: 327.w,
                      text: "Continue with Facebook",
                      fontColor: Colors.white,
                      color: AppColors.primaryblue,
                      image: "assets/icons/icon facebook.svg",
                      ishide: true,
                      ontap: () {
                        Get.to(() => Login());
                      }),
                  SizedBox(
                    height: 27.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customTextRegular(
                          title: "Don’t have an account? ",
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff7B7B7B)),
                      InkWell(
                        onTap: () => Get.to(() => const SignUp()),
                        child: customTextRegular(
                            title: "Register",
                            fontSize: 12.h,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryblue),
                      )
                      // customButton(text: "Don’t have an account?", fontColor: Colors.white,color: Colors.red,),
                      // customButton(text: "Register", fontColor: Colors.white,color: AppColors.primaryblue),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
