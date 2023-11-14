import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/Regcarddetails/Provider/myplan_provider.dart';
import 'package:health_pro/view/UserProfile/getuserprofile.dart';
import 'package:health_pro/view/Healthhistory/healthhistory.dart';
import 'package:health_pro/view/Help/help.dart';
import 'package:health_pro/view/Mypassword/mypassword.dart';
import 'package:health_pro/view/Profile/components/profilecomp1.dart';
import 'package:health_pro/view/Regcarddetails/regcarddetails.dart';
import 'package:health_pro/view/auth/Login/Provider/logout_provider.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../UserProfile/Provider/userprofile_provider.dart';
import '../terms_conditions/terms_and_conditions.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  @override
  void initState() {
    Provider.of<UserProfileProvider>(context, listen: false).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Consumer<UserProfileProvider>(
                builder: (context, value, child) {
                  return

                      // ignore: prefer_is_empty
                      value.userProfileModel.length == 0
                          ? SpinKitCircle(
                              color: AppColors.blueb9,
                              size: 20.sp,
                            )
                          : ListTile(
                              leading: CircleAvatar(
                                backgroundImage: value
                                            .userProfileModel[0].data!.image ==
                                        ''
                                    ? const AssetImage(
                                            "assets/images/avatar.png")
                                        as ImageProvider
                                    : NetworkImage(
                                        "${value.userProfileModel[0].data!.image}"),
                                radius: 25,
                              ),
                              title: customTextRegular(
                                  title:
                                      "${value.userProfileModel[0].data!.name}",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff181725)),
                              subtitle: customTextRegular(
                                  title:
                                      "${value.userProfileModel[0].data!.idNumber}",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff000A12)),
                            );
                },
              ),
              SizedBox(
                height: 19.h,
              ),
              Profilecomp1(
                text: 'My Profile',
                icon: CupertinoIcons.person_fill,
                ontap: () {
                  Get.to(() => const GetUserProfile());
                },
              ),
              Profilecomp1(
                text: 'My Care Card',
                icon: CupertinoIcons.creditcard_fill,
                ontap: () {
                  Provider.of<MyPlanProvider>(context, listen: false)
                      .getMyPlans()
                      .then((value) {
                    Get.to(() => RegcardDetails());
                  });
                },
              ),
              // Profilecomp1(
              //   text: 'My Transactions',
              //   image: AppImages.transactionicon,
              //   ontap: () {
              //     Get.to(() => const Healthhistory());
              //   },
              // ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const MyPasswordScreen());
                },
                child: Profilecomp1(
                  text: 'My Password',
                  image: AppImages.mypasswordicon,
                  ontap: () {
                    Get.to(() => const MyPasswordScreen());
                  },
                ),
              ),
              Profilecomp1(
                text: 'Logout',
                ficon: false,
                icon: Icons.logout,
                ontap: () {
                  Provider.of<LogoutProvider>(context, listen: false).logout();
                },
              ),
              // Profilecomp1(
              //   text: 'My Rewards',
              //   image: AppImages.rewardicon,
              //   ontap: () {},
              // ),
              SizedBox(
                height: 10.h,
              ),
              customTextRegular(
                  title: 'Community',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.cardcolor),
              SizedBox(
                height: 15.h,
              ),
              Profilecomp1(
                text: 'Frequently asked questions',
                icon: CupertinoIcons.question_circle_fill,
                ontap: () {
                  Get.to(() => const Helpscreen());
                },
              ),
              Profilecomp1(
                text: 'Terms and Conditions',
                image: AppImages.termsicon,
                ontap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditions(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
