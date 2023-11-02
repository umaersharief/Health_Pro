import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/auth/Login/View/login_view.dart';
import 'package:health_pro/view/auth/Register/Provider/register_provider.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:health_pro/view/widgets/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
import '../../../widgets/widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var items = ['Yourself', 'Child', 'Parent', 'Spouse', 'Sibling'];

  final GlobalKey<FormState> _formregisterKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cpasswordController = TextEditingController();
  final registraterforcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Consumer<RegisterProvider>(
              builder: (context, registerprovider, child) {
                return Form(
                  key: _formregisterKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // SizedBox(
                      //   height: 20.h,
                      // ),

                      // customTextRegular(
                      //     title: "Finally, you're back...",
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 20.h),

                      // SizedBox(
                      //   height: 24.h,
                      // ),

                      customTextRegular(
                          title: "Welcome to HealthPro Family",
                          height: 1.4,
                          fontSize: 20.h,
                          fontWeight: FontWeight.w600,
                          align: TextAlign.center),

                      customTextRegular(
                          title: "Please fill the form below",
                          height: 1.4,
                          fontSize: 12.h,
                          fontWeight: FontWeight.w400,
                          align: TextAlign.center),
                      SizedBox(
                        height: 38.h,
                      ),
                      customTextField(
                        controller: nameController,
                        hintText: "Name",
                        bordercolor: Colors.black.withOpacity(0.10),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
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
                        hintText: "Registration for",
                        bordercolor: Colors.black.withOpacity(0.10),
                        suffix: true,
                        controller: registraterforcontroller,
                        suffixWidget: PopupMenuButton<String>(
                          icon: const Icon(Icons.arrow_drop_down),
                          onSelected: (String value) {
                            registraterforcontroller.text = value;
                          },
                          itemBuilder: (BuildContext context) {
                            return items
                                .map<PopupMenuItem<String>>((String value) {
                              return PopupMenuItem(
                                  // ignore: sort_child_properties_last
                                  child: Text(value),
                                  value: value);
                            }).toList();
                          },
                        ),
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
                            return 'Field Cannot Be Empty';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      customTextField(
                        controller: cpasswordController,
                        hintText: "Confirm Password",
                        bordercolor: Colors.black.withOpacity(0.10),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm your password ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     InkWell(
                      //       onTap: () => Get.to(() => const Forgetpassword()),
                      //       child: customTextRegular(
                      //           title: "Forgot password?",
                      //           fontWeight: FontWeight.w400,
                      //           fontSize: 12.h,
                      //           color: const Color(0xff7B7B7B)),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 8.h,
                      // ),

                      // Row(
                      //   children: [
                      //     const CustomCheckBox(),
                      //     SizedBox(
                      //       width: 13.w,
                      //     ),
                      //     customTextRegular(
                      //         title: "Remember me",
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 12.h,
                      //         color: const Color(0xff7B7B7B)),
                      //   ],
                      // ),

                      SizedBox(
                        height: 20.h,
                      ),

                      customButton(
                        loading: registerprovider.loading,
                        spinkitcolor: AppColors.white,
                        text: "Sign up",
                        fontColor: Colors.white,
                        color: AppColors.primaryblue,
                        image: "assets/icons/Frame (1).svg",
                        ishide: false,
                        ontap: () {
                          if (_formregisterKey.currentState!.validate()) {
                            _formregisterKey.currentState!.save();

                            registerprovider.register(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword: cpasswordController.text,
                              registerfor: registraterforcontroller.text,
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customTextRegular(
                              title: "Already have an account? ",
                              fontSize: 12.h,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff7B7B7B)),
                          InkWell(
                            onTap: () => Get.to(() => Login()),
                            child: customTextRegular(
                                title: "Sign in",
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
                      // Row(
                      //   children: [
                      //     Expanded(
                      //         child:
                      //             customDivider(height: 1.h, width: Get.width)),
                      //     SizedBox(
                      //       width: 16.w,
                      //     ),
                      //     customTextRegular(
                      //         title: "or",
                      //         fontSize: 16.h,
                      //         fontWeight: FontWeight.w500,
                      //         color: const Color(0xff757575)),
                      //     SizedBox(
                      //       width: 16.w,
                      //     ),
                      //     Expanded(
                      //         child:
                      //             customDivider(height: 1.h, width: Get.width)),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 19.h,
                      // ),
                      // customButton(
                      //   text: "Continue with Google",
                      //   fontColor: Colors.white,
                      //   color: Colors.red,
                      //   image: "assets/icons/Frame (1).svg",
                      //   ishide: true,
                      // ),
                      // SizedBox(
                      //   height: 12.h,
                      // ),
                      // customButton(
                      //     text: "Continue with Facebook",
                      //     fontColor: Colors.white,
                      //     color: AppColors.primaryblue,
                      //     image: "assets/icons/icon facebook.svg",
                      //     ishide: true,
                      //     ontap: () {
                      //       Get.to(() => const SignUp());
                      //     }),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
