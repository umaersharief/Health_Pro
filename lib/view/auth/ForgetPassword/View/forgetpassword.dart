import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/auth/ForgetPassword/Provider/forgetpassword_provider.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:health_pro/view/widgets/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import '../../../widgets/widgets/custom_button.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

final GlobalKey<FormState> _formemailKey = GlobalKey<FormState>();
final TextEditingController emailController = TextEditingController();

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Consumer<ForgetPasswordProvider>(
                builder: (context, forgetpasword, child) {
                  return Form(
                    key: _formemailKey,
                    child: Column(
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
                            title: "Forget Password",
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp),
                        SizedBox(
                          height: 40.h,
                        ),
                        customTextField(
                          controller: emailController,
                          hintText: "Enter your Email",
                          validator: (value) {
                            RegExp regex = RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            } else if (!regex.hasMatch(value)) {
                              return 'please enter valid email';
                            }
                            return null;
                          },
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
                            if (_formemailKey.currentState!.validate()) {
                              _formemailKey.currentState!.save();
                              forgetpasword.sendOTP(
                                email: emailController.text,
                              );
                            }
                          },
                        )
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
