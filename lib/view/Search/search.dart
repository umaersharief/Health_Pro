import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/Homepage/Provider/home_provider.dart';
import 'package:health_pro/view/Search/components/searchcomp1.dart';
import 'package:health_pro/view/ClinicsDetails/clinic.dart';
import 'package:provider/provider.dart';

import '../ClinicsDetails/Provider/clinicsdetails_provider.dart';

// ignore: must_be_immutable
class Searchscreen extends StatelessWidget {
  Searchscreen({super.key});
  // List<Searchcomp1> mylist = [
  //   Searchcomp1(
  //       image: AppImages.c1,
  //       text1: 'Clinic Saadat',
  //       text2: '15th street avenuesads',
  //       text3: '4'),
  //   Searchcomp1(
  //       image: AppImages.c2,
  //       text1: 'Mahrshad P',
  //       text2: 'Shabrahim 14',
  //       text3: '4.1'),
  //   Searchcomp1(
  //       image: AppImages.c3,
  //       text1: 'Musad Dental Clinic',
  //       text2: 'Shabrahim 14',
  //       text3: '4.1'),
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 327.w,
                height: 48.h,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24.sp,
                      color: AppColors.cardcolor,
                    ),
                    labelText: 'Clinics',
                    labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackb1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.5.w,
                        color: const Color.fromRGBO(0, 0, 0, 0.10),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Consumer<HomeProvider>(
                builder: (context, allclinics, child) {
                  return SizedBox(
                    height: 640.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allclinics.allClinicsModel[0].data!.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.off(() => Clinicscreen(Provider
                                      .of<ClinicDetailProvider>(context,
                                          listen: false)
                                  .clinicID =
                              "${allclinics.allClinicsModel[0].data![index].id}"));
                        },
                        child: Searchcomp1(
                            image: AppImages.c1,
                            title:
                                "${allclinics.allClinicsModel[0].data![index].name}",
                            description:
                                "${allclinics.allClinicsModel[0].data![index].description}",
                            review:
                                "${allclinics.allClinicsModel[0].data![index].totalReviews}",
                            rating: allclinics
                                .allClinicsModel[0].data![index].totalReviews!
                                .toDouble()),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
