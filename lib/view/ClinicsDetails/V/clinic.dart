import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/ClinicsDetails/M/singleclinik_model.dart';
import 'package:health_pro/view/Location/V/location.dart';
import 'package:health_pro/view/ClinicsDetails/components/cliniccomp1.dart';
import 'package:health_pro/view/ClinicsDetails/components/doctorcomp.dart';
import 'package:health_pro/view/ClinicsDetails/components/iconwithtext.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

import '../C/controller.dart';

// ignore: must_be_immutable
class Clinicscreen extends StatefulWidget {
  SingleClinikData clinikData;
  Clinicscreen({super.key, required this.clinikData});

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
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(child:
          SingleChildScrollView(child: GetBuilder<ClinicDetailController>(
        builder: (obj) {
          // ignore: prefer_is_empty
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 329.h,
                        width: double.infinity,
                        child: PageView.builder(
                          controller: obj.controller,
                          onPageChanged: (value) {
                            obj.iscliked = value;
                            obj.update();
                          },
                          itemCount: widget.clinikData.image!.isEmpty
                              ? 3
                              : widget.clinikData.image!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: height,
                              width: width,
                              foregroundDecoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1)),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                image: widget.clinikData.image!.isEmpty
                                    ? DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(AppImages.clinicpic))
                                    : DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            widget.clinikData.image![index])),
                              ),
                            );
                          },
                        ),
                      ),
                      widget.clinikData.image!.length == 1
                          ? const SizedBox()
                          : Padding(
                              padding: EdgeInsets.only(top: height * 0.36),
                              child: Center(
                                child: SizedBox(
                                    height: height * 0.013,
                                    width: width,
                                    child: Center(
                                        child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(
                                          widget.clinikData.image!.isEmpty
                                              ? 3
                                              : widget.clinikData.image!.length,
                                          (index) {
                                        return Container(
                                          height: obj.iscliked == index
                                              ? height * 0.008
                                              : height * 0.008,
                                          width: obj.iscliked == index
                                              ? width * 0.045
                                              : width * 0.035,
                                          decoration: obj.iscliked == index
                                              ? BoxDecoration(
                                                  color: obj.iscliked == index
                                                      ? AppColors.cardcolor
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.05),
                                                )
                                              : BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: obj.iscliked == index
                                                      ? AppColors.cardcolor
                                                      : Colors.white,
                                                ),
                                        );
                                      }),
                                    ))),
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
                      title: "${widget.clinikData.name}",
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
                      title: "${widget.clinikData.description}",
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
                          clinikData: widget.clinikData,
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
                    text: "${widget.clinikData.time}",
                    icon: CupertinoIcons.clock_fill,
                  ),
                  Iconwithtext(
                    text: "${widget.clinikData.area}",
                    icon: Icons.location_on,
                  ),
                  Iconwithtext(
                    text: "${widget.clinikData.phone}",
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
                      itemCount: widget.clinikData.services!.data!.length,
                      itemBuilder: (context, index) => Doctorcomp(
                        image: AppImages.d1,
                        name: widget.clinikData.services!.data![0].name
                            .toString(),
                        specilist: widget
                            .clinikData.services!.data![0].department
                            .toString(),
                      ),
                    ),
                  )
                ],
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
                    top: height * 0.3, left: width * 0.03, right: width * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Cliniccomp1(
                      text: "${widget.clinikData.area}",
                      icon: Icons.location_on,
                    ),
                    Cliniccomp1(
                      text: "${widget.clinikData.totalReviews}",
                      icon: Icons.star,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ))),
    );
  }
}
