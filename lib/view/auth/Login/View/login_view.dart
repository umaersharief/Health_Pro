import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/auth/Register/View/register_view.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:health_pro/view/widgets/widgets/custom_textfield.dart';
import '../../../widgets/widgets/custom_button.dart';
import '../../../widgets/widgets/custom_dailogue.dart';
import '../../ForgetPassword/View/forgetpassword.dart';
import '../Provider/login_provider.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  String? email;
  String? password;
  Login({Key? key, this.password, this.email}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formloginKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email ?? "";
    passwordController.text = widget.password ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<LogInProvider>(
              builder: (context, loginprovider, child) {
                return Form(
                  key: _formloginKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                              )),
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
                          title: "Welcome Back!",
                          fontWeight: FontWeight.w600,
                          fontSize: 20.h),
                      SizedBox(
                        height: 10.h,
                      ),
                      // customTextRegular(
                      //     title:
                      //         "You haven't been back for a long time, how are you now? I hope you are alright.",
                      //     height: 1.4,
                      //     fontSize: 12.h,
                      //     fontWeight: FontWeight.w400,
                      //     align: TextAlign.center),
                      SizedBox(
                        height: 38.h,
                      ),
                      customTextField(
                        controller: emailController,
                        hintText: "Email",
                        bordercolor: Colors.black.withOpacity(0.10),
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
                        height: 12.h,
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
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const Forgetpassword());
                            },
                            child: customTextRegular(
                                title: "Forgot password?",
                                fontWeight: FontWeight.w500,
                                fontSize: 13.h,
                                color: const Color(0xff7B7B7B)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          const CustomCheckBox(),
                          SizedBox(
                            width: 13.w,
                          ),
                          customTextRegular(
                              title: "Remember me",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.h,
                              color: const Color(0xff7B7B7B)),
                        ],
                      ),
                      SizedBox(
                        height: 39.h,
                      ),

                      customButton(
                          loading: loginprovider.loading,
                          spinkitcolor: AppColors.white,
                          text: "Sign in",
                          fontColor: Colors.white,
                          color: AppColors.primaryblue,
                          image: "assets/icons/Frame (1).svg",
                          ishide: false,
                          ontap: () {
                            if (_formloginKey.currentState!.validate()) {
                              _formloginKey.currentState!.save();

                              loginprovider.login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
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
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Expanded(
                          //     child:
                          //         customDivider(height: 1.h, width: Get.width)),
                          SizedBox(
                            width: 16.w,
                          ),
                          // customTextRegular(
                          //     title: "or",
                          //     fontSize: 16.h,
                          //     fontWeight: FontWeight.w500,
                          //     color: const Color(0xff757575)),
                          // SizedBox(
                          //   width: 16.w,
                          // ),
                          // Expanded(
                          //     child:
                          //         customDivider(height: 1.h, width: Get.width)),
                        ],
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      // customButton(
                      //   ontap: () {
                      //     loginprovider.signInWithGoogle(context);
                      //   },
                      //   text: "Continue with Google",
                      //   fontColor: Colors.white,
                      //   color: Colors.red,
                      //   image: "assets/icons/Frame (1).svg",
                      //   ishide: true,
                      // ),
                      SizedBox(
                        height: 12.h,
                      ),
                      // customButton(
                      //     text: "Continue with Facebook",
                      //     fontColor: Colors.white,
                      //     color: AppColors.primaryblue,
                      //     image: "assets/icons/icon facebook.svg",
                      //     ishide: true,
                      //     ontap: () {
                      //       Get.to(() => const SignUp());
                      //     }),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
