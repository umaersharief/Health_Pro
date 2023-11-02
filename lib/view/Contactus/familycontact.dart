import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Contactus/components/myrow.dart';
import 'package:health_pro/view/widgets/widgets/custom_button.dart';
import 'package:health_pro/view/widgets/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constant.dart';
import '../../utils/app_images.dart';
import '../widgets/widgets/custom_text.dart';
import 'Provider/teamcontact_provider.dart';

class FamilyContact extends StatefulWidget {
  const FamilyContact({super.key});

  @override
  State<FamilyContact> createState() => _FamilyContactState();
}

class _FamilyContactState extends State<FamilyContact> {
  final GlobalKey<FormState> _formfamilyKey = GlobalKey<FormState>();

  String errortext = '';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController concernController = TextEditingController();

  void checkvalidation() {
    if (numberController.text == '' ||
        emailController.text == '' ||
        concernController.text == '') {
      setState(() {
        errortext = 'Please fill all the fields';
      });
    } else {
      setState(() {
        errortext = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formfamilyKey,
              child: Consumer<TeamContactProvider>(
                builder: (context, teamcontact, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 31.w, vertical: 20),
                            height: 220.h,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: const Color(0xff004667),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15.r),
                                  bottomRight: Radius.circular(15.r)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.dividercolor,
                                        size: 20.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 22.w,
                                    ),
                                    customTextRegular(
                                        title: 'Contact Us',
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.dividercolor),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -28,
                            left: 15,
                            right: 15,
                            child: Container(
                              width: 312.w,
                              height: 117.h,
                              decoration: BoxDecoration(
                                color: const Color(0xffDEEAFF),
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -19,
                            left: 15,
                            right: 15,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              width: Get.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white, width: 1.5.w),
                                color: const Color(0xff004667),
                                borderRadius: BorderRadius.circular(14.r),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      SizedBox(
                                          width: 190.w,
                                          child: customTextRegular(
                                              title: "Get Our Plans Today",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17.h,
                                              color: Colors.white,
                                              height: 1.5)),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      Myrow(
                                          icon: Icons.phone,
                                          text: '+974 40022124'),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Myrow(
                                          icon: Icons.phone,
                                          text: '+974 31195004'),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Myrow(
                                          icon: Icons.email,
                                          text: 'Info@Healthpro.Com.Qa'),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage(AppImages.decolines),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Image.asset(
                                        AppImages.docimage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 75.h,
                      ),
                      gettext('Enter your Name'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          child: customTextField(
                            hintText: 'Enter your Name',
                            controller: nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your name ';
                              }
                              return null;
                            },
                          )),
                      // SizedBox(
                      //   height: 20.h,
                      // ),
                      // gettext('Enter your number'),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 15.w),
                      //     child: customTextField(
                      //       hintText: 'Enter your number',
                      //       controller: numberController,
                      //       validator: (value) {
                      //         if (value!.isEmpty) {
                      //           return 'Please enter your number ';
                      //         }
                      //         return null;
                      //       },
                      //     )),
                      SizedBox(
                        height: 20.h,
                      ),
                      gettext('Enter email'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          child: customTextField(
                            hintText: 'Enter email',
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email ';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 20.h,
                      ),
                      gettext('Enter your concern'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.w),
                          child: customTextField(
                            hintText: 'Type your message......',
                            maxLines: 10,
                            height: 132.h,
                            controller: concernController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          )),
                      SizedBox(
                        height: 32.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.w),
                        child: customButton(
                          loading: teamcontact.loading,

                          spinkitcolor: AppColors.white,
                          text: 'Send us message',
                          fontColor: AppColors.dividercolor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          borderRadius: 11.r,
                          //ontap: checkvalidation,
                          ontap: () {
                            if (_formfamilyKey.currentState!.validate()) {
                              _formfamilyKey.currentState!.save();
                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text);

                              if (emailValid) {
                                teamcontact.orderfamilyPackage(
                                  name: nameController.text,
                                  message: concernController.text,
                                  email: emailController.text,
                                );
                              } else {
                                AppConstant.showCustomSnackBar("Invalid email.",
                                    isError: true);
                              }
                            }
                            // nameController.clear();
                            // concernController.clear();
                            // emailController.clear();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Center(
                        child: customTextRegular(
                          title: errortext,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffF00000),
                        ),
                      ),
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}

Widget gettext(String text) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    child: customTextRegular(
      title: text,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.cardcolor,
    ),
  );
}
