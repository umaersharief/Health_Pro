import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/Location/location.dart';
import 'package:health_pro/view/ClinicsDetails/components/cliniccomp1.dart';
import 'package:health_pro/view/ClinicsDetails/components/doctorcomp.dart';
import 'package:health_pro/view/ClinicsDetails/components/iconwithtext.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

import '../C/controller.dart';

// ignore: must_be_immutable
class Clinicscreen extends StatefulWidget {
  String clinicID;
  Clinicscreen({super.key, required this.clinicID});

  @override
  State<Clinicscreen> createState() => _ClinicscreenState();
}

class _ClinicscreenState extends State<Clinicscreen> {
  List<String> images1 = [
    AppImages.person3,
    AppImages.person1,
    AppImages.person2
  ];

  List<String> images2 = [AppImages.d1, AppImages.d2, AppImages.d3];
  @override
  void initState() {
    ClinicDetailController.my.getClinicsbyID(widget.clinicID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child:
          SingleChildScrollView(child: GetBuilder<ClinicDetailController>(
        builder: (obj) {
          // ignore: prefer_is_empty
          return obj.cliicsDetailsModel == null
              ? SizedBox(
                  height: height,
                  child: SpinKitCircle(color: AppColors.blueb9, size: 20.sp))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 329.h,
                          width: double.infinity,
                          child: PageView(
                            controller: obj.controller,
                            onPageChanged: (value) {
                              obj.iscliked = value;
                              obj.update();
                            },
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: height * 0.4,
                                    width: width,
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1)),
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                AppImages.clinicpic))),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: height * 0.4,
                                    width: width,
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1)),
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                AppImages.clinicpic))),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: height * 0.4,
                                    width: width,
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.1)),
                                    decoration: BoxDecoration(
                                        color: Colors.white24,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                AppImages.clinicpic))),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.36),
                          child: Center(
                            child: SizedBox(
                              height: height * 0.03,
                              width: width * 0.2,
                              // color: Colors.amber,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: obj.iscliked == 0
                                          ? height * 0.008
                                          : height * 0.008,
                                      width: obj.iscliked == 0
                                          ? width * 0.045
                                          : width * 0.035,
                                      decoration: obj.iscliked == 0
                                          ? BoxDecoration(
                                              color: obj.iscliked == 0
                                                  ? AppColors.cardcolor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.05))
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: obj.iscliked == 0
                                                  ? AppColors.cardcolor
                                                  : Colors.white,
                                            )),
                                  SizedBox(width: width * 0.005),
                                  Container(
                                      height: obj.iscliked == 1
                                          ? height * 0.008
                                          : height * 0.008,
                                      width: obj.iscliked == 1
                                          ? width * 0.045
                                          : width * 0.035,
                                      decoration: obj.iscliked == 1
                                          ? BoxDecoration(
                                              color: obj.iscliked == 1
                                                  ? AppColors.cardcolor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.05))
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: obj.iscliked == 1
                                                  ? AppColors.cardcolor
                                                  : Colors.white,
                                            )),
                                  SizedBox(width: width * 0.005),
                                  Container(
                                      height: obj.iscliked == 2
                                          ? height * 0.008
                                          : height * 0.008,
                                      width: obj.iscliked == 2
                                          ? width * 0.045
                                          : width * 0.035,
                                      decoration: obj.iscliked == 2
                                          ? BoxDecoration(
                                              color: obj.iscliked == 2
                                                  ? AppColors.cardcolor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 0.05))
                                          : BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: obj.iscliked == 2
                                                  ? AppColors.cardcolor
                                                  : Colors.white,
                                            )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 30.sp,
                                color: AppColors.primaryblue,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.3,
                              left: width * 0.03,
                              right: width * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Cliniccomp1(
                                text: "${obj.cliicsDetailsModel!.data!.area}",
                                icon: Icons.location_on,
                              ),
                              Cliniccomp1(
                                text:
                                    "${obj.cliicsDetailsModel!.data!.totalReviews}",
                                icon: Icons.star,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 17.h,
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 17.w),
                      child: customTextRegular(
                        title: 'Name',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.cardcolor,
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 17, top: 10, bottom: 10),
                      child: customTextRegular(
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackb1,
                        title: "${obj.cliicsDetailsModel!.data!.name}",
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 17.w),
                      child: customTextRegular(
                        title: 'About',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.cardcolor,
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(left: 17, top: 10, bottom: 10),
                      child: customTextRegular(
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackb1,
                        title: "${obj.cliicsDetailsModel!.data!.description}",
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 17.w),
                      child: customTextRegular(
                        title: 'Location',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.cardcolor,
                      ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => Locationscreen(
                            clinikData: obj.cliicsDetailsModel!.data!,
                          )),
                      child: Image.asset(
                        AppImages.mapimage,
                        height: 256.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Iconwithtext(
                      text: "${obj.cliicsDetailsModel!.data!.time}",
                      icon: CupertinoIcons.clock_fill,
                    ),
                    Iconwithtext(
                      text: "${obj.cliicsDetailsModel!.data!.area}",
                      icon: Icons.location_on,
                    ),
                    Iconwithtext(
                      text: "${obj.cliicsDetailsModel!.data!.phone}",
                      icon: CupertinoIcons.phone_fill,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 17.w),
                    //   child: customTextRegular(
                    //     title: 'Doctors',
                    //     fontSize: 16.sp,
                    //     fontWeight: FontWeight.w700,
                    //     color: AppColors.cardcolor,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    // SizedBox(
                    //   height: 171.h,
                    //   child: ListView.builder(
                    //     itemCount: images1.length,
                    //     scrollDirection: Axis.horizontal,
                    //     shrinkWrap: true,
                    //     itemBuilder: (context, index) =>
                    //         Personcomp(path: images1[index]),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15.h,
                    // ),
                    Container(
                      margin: const EdgeInsets.only(left: 17),
                      child: customTextRegular(
                        title: 'Services',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.cardcolor,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 260.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: obj
                            .cliicsDetailsModel!.data!.services!.data!.length,
                        itemBuilder: (context, index) => Doctorcomp(
                          image: AppImages.d1,
                          name: obj
                              .cliicsDetailsModel!.data!.services!.data![0].name
                              .toString(),
                          specilist: obj.cliicsDetailsModel!.data!.services!
                              .data![0].department
                              .toString(),
                        ),
                      ),
                    )
                  ],
                );
        },
      ))),
    );
  }
}
