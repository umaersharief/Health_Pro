import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_pro/view/auth/ForgetPassword/Provider/forgetpassword_provider.dart';
import 'package:provider/provider.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:health_pro/view/widgets/widgets/custom_textfield.dart';

import '../../../widgets/widgets/custom_button.dart';

// ignore: must_be_immutable
class ResetPassword extends StatefulWidget {
  String? code;

  ResetPassword({Key? key, this.code}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formresetPasswordKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<ForgetPasswordProvider>(
              builder: (context, forgetpassword, child) {
                return Form(
                  key: _formresetPasswordKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
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
                        height: 66.h,
                      ),
                      customTextRegular(
                          title: "Change Password!",
                          fontWeight: FontWeight.w600,
                          fontSize: 20.h),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      customTextField(
                        controller: passwordController,
                        hintText: "Password",
                        bordercolor: Colors.black.withOpacity(0.10),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      customTextField(
                        controller: confirmpasswordController,
                        hintText: "Confirm Password",
                        bordercolor: Colors.black.withOpacity(0.10),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 39.h,
                      ),
                      customButton(
                          loading: forgetpassword.loading,
                          spinkitcolor: AppColors.white,
                          text: "Change Password",
                          fontColor: Colors.white,
                          image: "assets/icons/Frame (1).svg",
                          ishide: false,
                          ontap: () {
                            if (_formresetPasswordKey.currentState!
                                .validate()) {
                              _formresetPasswordKey.currentState!.save();

                              forgetpassword.resetPassword(
                                  code: widget.code.toString(),
                                  password: passwordController.text,
                                  confirmpassword:
                                      confirmpasswordController.text);
                            }

                            passwordController.clear();
                            confirmpasswordController.clear();
                          }),
                      SizedBox(
                        height: 19.h,
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
