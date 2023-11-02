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
import 'package:provider/provider.dart';

import 'Provider/clinicsdetails_provider.dart';

// ignore: must_be_immutable
class Clinicscreen extends StatefulWidget {
  // String clinicID;
  Clinicscreen(
    param0, {
    super.key,
    //required this.clinicID
  });

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
    Provider.of<ClinicDetailProvider>(context, listen: false).getClinicsbyID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      Provider.of<ClinicDetailProvider>(context, listen: false)
          .getClinicsbyID();
      super.initState();
    }

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(child: Consumer<ClinicDetailProvider>(
        builder: (context, clinicdetailprovider, child) {
          // ignore: prefer_is_empty
          return clinicdetailprovider.cliicsDetailsModel.length == 0
              ? SpinKitCircle(color: AppColors.blueb9, size: 20.sp)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      height: 329.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.clinicpic),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                size: 30.sp,
                                color: AppColors.white,
                              )),
                          // IconButton(
                          //   onPressed: () => Get.back(),
                          //   icon: Icon(
                          //     Icons.arrow_back,
                          //     color: Colors.white,
                          //     size: 25.sp,
                          //   ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Cliniccomp1(
                                text:
                                    "${clinicdetailprovider.cliicsDetailsModel[0].data!.area}",
                                icon: Icons.location_on,
                              ),
                              Cliniccomp1(
                                text:
                                    "${clinicdetailprovider.cliicsDetailsModel[0].data!.totalReviews}",
                                icon: Icons.star,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
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
                      onTap: () => Get.to(() => Locationscreen()),
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
                      text:
                          "${clinicdetailprovider.cliicsDetailsModel[0].data!.time}",
                      icon: CupertinoIcons.clock_fill,
                    ),
                    Iconwithtext(
                      text:
                          "${clinicdetailprovider.cliicsDetailsModel[0].data!.area}",
                      icon: Icons.location_on,
                    ),
                    Iconwithtext(
                      text:
                          "${clinicdetailprovider.cliicsDetailsModel[0].data!.phone}",
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
                      margin: EdgeInsets.only(left: 17),
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
                        itemCount: clinicdetailprovider
                            .cliicsDetailsModel[0].data!.services!.data!.length,
                        itemBuilder: (context, index) => Doctorcomp(
                          image: AppImages.d1,
                          name: clinicdetailprovider.cliicsDetailsModel[0].data!
                              .services!.data![0].name
                              .toString(),
                          specilist: clinicdetailprovider.cliicsDetailsModel[0]
                              .data!.services!.data![0].department
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
