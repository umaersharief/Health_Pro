import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/allcliniks/C/controller.dart';
import 'package:health_pro/view/allcliniks/components/searchcomp1.dart';
import 'package:health_pro/view/ClinicsDetails/V/clinic.dart';
import 'package:provider/provider.dart';

import '../../ClinicsDetails/C/controller.dart';

class Searchscreen extends StatefulWidget {
  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
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
  void initState() {
    Get.put(AllClinikCOntroller());
    Get.put(ClinicDetailController());
    AllClinikCOntroller.my.firstdataload(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<AllClinikCOntroller>(builder: (obj) {
        return Container(
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
                    onChanged: (value) {
                      obj.querry = value;
                      obj.getfiltercliniks(context);
                    },
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
                SizedBox(
                  height: 640.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: obj.filterscliicsModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(() => Clinicscreen(
                            clinicID: "${obj.filterscliicsModel[index].id}"));
                      },
                      child: obj.filterscliicsModel[index].name ==
                                  "Aster Hospital" ||
                              obj.filterscliicsModel[index].name ==
                                  "Aster Medical Center"
                          ? const SizedBox()
                          : Searchcomp1(
                              image: "${obj.filterscliicsModel[index].image}",
                              title: "${obj.filterscliicsModel[index].name}",
                              description:
                                  "${obj.filterscliicsModel[index].description}",
                              review:
                                  "${obj.filterscliicsModel[index].totalReviews}",
                              rating: obj
                                  .filterscliicsModel[index].totalReviews!
                                  .toDouble()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
