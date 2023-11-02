import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_pro/view/auth/ForgetPassword/Provider/forgetpassword_provider.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/widgets/custom_button.dart';

class Otpscreen extends StatefulWidget {
  const Otpscreen({super.key});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final _formKeyotp = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Consumer<ForgetPasswordProvider>(
                builder: (context, forgetpasword, child) {
                  return Form(
                    key: _formKeyotp,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () => Get.back(),
                                child: SvgPicture.asset(
                                    "assets/icons/Arrow-back.svg")),
                          ],
                        ),
                        Image.asset(
                          "assets/icons/HealthPro-Logo-1 1.png",
                          height: 60.h,
                          width: 153.w,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        customTextRegular(
                          title: "Varify OTP",
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        customTextRegular(
                          title: "Enter the 4-digit code sent to the email",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Pinput(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a PIN';
                                } else if (value.length < 4) {
                                  return 'PIN must be 5 digits';
                                }
                                return null; // input is valid
                              },
                              focusNode: _pinPutFocusNode,
                              controller: _pinPutController,
                              length: 4,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              defaultPinTheme: PinTheme(
                                  height: 52.h,
                                  width: 40.w,
                                  textStyle: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                      color: const Color(0xff263238),
                                      width: 1.w,
                                      style: BorderStyle.solid,
                                    ),
                                  ))),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        customButton(
                          loading: forgetpasword.loading,
                          text: "Continue",
                          fontColor: Colors.white,
                          spinkitcolor: AppColors.white,
                          ontap: () {
                            if (_formKeyotp.currentState!.validate()) {
                              _formKeyotp.currentState!.save();
                              forgetpasword.varifyOTP(
                                code: _pinPutController.text,
                              );
                            }
                          },
                        )
                        // customTextRegular(
                        //   title: "Didn't receive the code?",
                        //   fontWeight: FontWeight.w400,
                        //   fontSize: 14.sp,
                        //   color: Colors.blueGrey,
                        // ),
                        // SizedBox(
                        //   height: 15.h,
                        // ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: customTextRegular(
                        //     title: "Resend it",
                        //     isunderline: true,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 14.sp,
                        //     color: Colors.blueGrey,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
