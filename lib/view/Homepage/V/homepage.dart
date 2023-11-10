import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/CardDetails/Provider/pandetails_provider.dart';
import 'package:health_pro/view/Cardregistration/cardregistration.dart';
import 'package:health_pro/view/Homepage/C/controller.dart';
import 'package:health_pro/view/UserProfile/Provider/userprofile_provider.dart';
import 'package:health_pro/view/CardDetails/carddetails.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import '../../Cardregistration/Provider/cardregister_provider.dart';
import '../../Contactus/Provider/teamcontact_provider.dart';
import '../../Packages/Familypackage/familypackage.dart';
import '../../Packages/TeamPackage/teampackage.dart';
import '../../allcliniks/C/controller.dart';
import '../components/homecomponent.dart';
import '../components/servicecomponent.dart';
import '../components/shimercomponenet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(HomeController());
    Provider.of<UserProfileProvider>(context, listen: false).getUserProfile();
    HomeController.my.getCorporateplan();
    HomeController.my.getIndividualplan();
    HomeController.my.getallClinics();
    HomeController.my.getSchemes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 20),
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
                      SizedBox(height: 20.h),
                      Consumer<UserProfileProvider>(
                        builder: (context, value, child) {
                          // ignore: prefer_is_empty
                          return value.userProfileModel.length == 0
                              ? SpinKitCircle(
                                  color: AppColors.blueb9,
                                  size: 20.sp,
                                )
                              : Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: value.userProfileModel[0]
                                                  .data!.image ==
                                              ''
                                          ? const AssetImage(
                                                  "assets/images/avatar.png")
                                              as ImageProvider
                                          : NetworkImage(
                                              "${value.userProfileModel[0].data!.image}"),
                                      radius: 20,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    customTextRegular(
                                        title:
                                            "${value.userProfileModel[0].data!.name}",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.h),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                  ],
                                );
                        },
                      )
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      color: const Color(0xff004667),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                width: 220.w,
                                child: customTextRegular(
                                    title:
                                        "Get Our Plans Today With Discount Benefits ",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.h,
                                    color: Colors.white,
                                    height: 1.5)),
                            SizedBox(
                              height: 4.h,
                            ),
                            SizedBox(
                              width: 200.w,
                              child: customTextRegular(
                                title: "The only discount card by healthpro  ",
                                fontWeight: FontWeight.w500,
                                fontSize: 12.h,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.decolines),
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
              height: 46.h,
            ),
            GetBuilder<HomeController>(
              builder: (obj) {
                // ignore: avoid_unnecessary_containers
                return Container(
                  // padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTextRegular(
                                title: "Individual Care Cards",
                                fontWeight: FontWeight.w600,
                                fontSize: 18.h,
                                color: AppColors.blue667,
                                height: 1.0),

                            // GestureDetector(
                            //   onTap: () {
                            //     Get.to(() => CardDetails());
                            //   },
                            //   child: customTextRegular(
                            //       title: "See All",
                            //       fontWeight: FontWeight.w600,
                            //       fontSize: 18.h,
                            //       color: AppColors.blue667,
                            //       height: 1.5),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      obj.individualplanModel.isEmpty
                          // ? SpinKitCircle(
                          //     color: AppColors.blueb9,
                          //     size: 20.sp,
                          //   )

                          ? const HomeShimer()
                          // ignore: prefer_is_empty
                          : obj.individualplanModel[0].data!.length == 0
                              ? const Text("NO Individual Card ")
                              : SizedBox(
                                  height: 270.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: obj
                                          .individualplanModel[0].data!.length,
                                      itemBuilder: (context, index) {
                                        return Homecomponent(
                                          image:
                                              "${obj.individualplanModel[0].data![index].image}",
                                          title:
                                              "${obj.individualplanModel[0].data![index].name}",
                                          price:
                                              "${obj.individualplanModel[0].data![index].price}",
                                          imageonTap: () {
                                            Provider.of<PlanDetailsProvider>(
                                                        context,
                                                        listen: false)
                                                    .planID =
                                                obj.individualplanModel[0]
                                                    .data![index].id
                                                    .toString();

                                            Get.to(() => CardDetails());
                                          },
                                          ontap: () => Get.to(() =>
                                              CardRegistration(
                                                  Provider.of<CareCardRegiterProvider>(
                                                              context,
                                                              listen: false)
                                                          .planID =
                                                      obj.individualplanModel[0]
                                                          .data![index].id
                                                          .toString())),
                                        );
                                      }),
                                ),

                      SizedBox(
                        height: 21.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTextRegular(
                                title: "Corporate Care Card",
                                fontWeight: FontWeight.w600,
                                fontSize: 18.h,
                                color: AppColors.blue667,
                                height: 1.5),
                            GestureDetector(
                              onTap: () {
                                // Get.to(() => CardDetails());
                              },
                              child: customTextRegular(
                                  title: "See All",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.h,
                                  color: AppColors.blue667,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      obj.corporateplanModel.isEmpty
                          ? SpinKitCircle(
                              color: AppColors.blueb9,
                              size: 20.sp,
                            )
                          // ignore: prefer_is_empty
                          : obj.corporateplanModel[0].data!.length == 0
                              ? const Text("NO Individual Card ")
                              : SizedBox(
                                  height: 270.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: obj
                                          .corporateplanModel[0].data!.length,
                                      itemBuilder: (context, index) {
                                        return Homecomponent(
                                          image:
                                              "${obj.corporateplanModel[0].data![index].image}",
                                          title:
                                              "${obj.corporateplanModel[0].data![index].name}",
                                          price:
                                              "${obj.corporateplanModel[0].data![index].price}",
                                          imageonTap: () {
                                            Provider.of<PlanDetailsProvider>(
                                                        context,
                                                        listen: false)
                                                    .planID =
                                                obj.individualplanModel[0]
                                                    .data![index].id
                                                    .toString();

                                            Get.to(() => CardDetails());
                                          },
                                          ontap: () => Get.to(() =>
                                              CardRegistration(
                                                  Provider.of<CareCardRegiterProvider>(
                                                              context,
                                                              listen: false)
                                                          .planID =
                                                      obj.corporateplanModel[0]
                                                          .data![index].id
                                                          .toString())),
                                        );
                                      }),
                                ),

                      SizedBox(
                        height: 23.h,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: customTextRegular(
                                title: "Schemes and Packages",
                                fontWeight: FontWeight.w600,
                                fontSize: 18.h,
                                color: AppColors.blue667,
                                height: 1.5),
                          ),
                          // GestureDetector(
                          //   onTap: () {
                          //     Get.to(() => CardDetails());
                          //   },
                          //   child: customTextRegular(
                          //       title: "See All",
                          //       fontWeight: FontWeight.w600,
                          //       fontSize: 18.h,
                          //       color: AppColors.blue667,
                          //       height: 1.5),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      obj.schemesPackageModel == null
                          ? SpinKitCircle(
                              color: AppColors.blueb9,
                              size: 20.sp,
                            )
                          : SizedBox(
                              height: 270.h,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      obj.schemesPackageModel!.data!.length,
                                  itemBuilder: (context, index) {
                                    return Homecomponent(
                                      ispackage: true,
                                      image:
                                          "${obj.schemesPackageModel!.data![index].image}",
                                      imageonTap: () {},
                                      ontap: () {
                                        if (obj.schemesPackageModel!
                                                .data![index].name ==
                                            'Team') {
                                          Provider.of<TeamContactProvider>(
                                                      context,
                                                      listen: false)
                                                  .schmID =
                                              obj.schemesPackageModel!
                                                  .data![index].id;

                                          Get.to(() => Teampackage(
                                                dataPlan: obj
                                                    .schemesPackageModel!
                                                    .data![index],
                                              ));
                                        } else {
                                          Provider.of<TeamContactProvider>(
                                                      context,
                                                      listen: false)
                                                  .schmID =
                                              obj.schemesPackageModel!
                                                  .data![index].id;

                                          Get.to(() => Familypackage(
                                                dataPlan: obj
                                                    .schemesPackageModel!
                                                    .data![index],
                                              ));
                                        }
                                      },
                                      title:
                                          "${obj.schemesPackageModel!.data![index].name}",
                                      price: '',
                                    );
                                  }),
                            ),
                      SizedBox(
                        height: 23.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: customTextRegular(
                            title: "Service Providers",
                            fontWeight: FontWeight.w600,
                            fontSize: 18.h,
                            color: AppColors.blue667,
                            height: 1.5),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      // ignore: prefer_is_empty

                      obj.allClinicsModel == null
                          ? SpinKitCircle(
                              color: AppColors.white,
                              size: 20.sp,
                            )
                          // ignore: prefer_is_empty
                          : obj.allClinicsModel!.data!.length == 0
                              ? const Text("No Clinics ")
                              : SizedBox(
                                  height: 115.h,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          obj.allClinicsModel!.data!.length,
                                      itemBuilder: (context, index) {
                                        final allClinics =
                                            obj.allClinicsModel!.data![index];
                                        return Servicecomponent(
                                          image: allClinics.logo!,
                                          title: "${allClinics.name}",
                                          description:
                                              "${allClinics.description}",
                                          area: "${allClinics.area}",
                                        );
                                      }),
                                ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
