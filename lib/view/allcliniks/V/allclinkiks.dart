import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/allcliniks/C/controller.dart';
import 'package:health_pro/view/ClinicsDetails/V/clinic.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';

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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GetBuilder<AllClinikCOntroller>(builder: (obj) {
        return SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
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
                        color: AppColors.grey75),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.5.w,
                        color: const Color.fromRGBO(0, 0, 0, 0.10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        width: 1.5.w,
                        color: AppColors.primaryblue,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Expanded(
                child: SizedBox(
                  height: height,
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: obj.filterscliicsModel.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        ClinicDetailController.my
                            .getClinicsbyID(obj.filterscliicsModel[index].id)
                            .then((value) {
                          Get.to(() => Clinicscreen(
                                clinikData:
                                    ClinicDetailController.my.clinikDatta!,
                              ));
                        });
                      },
                      child: obj.filterscliicsModel[index].name ==
                                  "Aster Hospital" ||
                              obj.filterscliicsModel[index].name ==
                                  "Aster Medical Center"
                          ? const SizedBox()
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05,
                                  vertical: height * 0.01),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: AppColors.dividercolor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(4, 4),
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 60.w,
                                        height: 60.h,
                                        decoration: BoxDecoration(
                                            // color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "${obj.filterscliicsModel[index].logo}"),
                                                // image: AssetImage(AppImages.clinicpic),
                                                fit: BoxFit.contain)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    SizedBox(
                                      height: height * 0.1,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.6,
                                            child: customTextRegular(
                                                maxlines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                title:
                                                    "${obj.filterscliicsModel[index].name}",
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.black),
                                          ),

                                          SizedBox(
                                            width: width * 0.6,
                                            child: customTextRegular(
                                                overflow: TextOverflow.ellipsis,
                                                title:
                                                    "${obj.filterscliicsModel[index].description}",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyg1),
                                          ),
                                          // SizedBox(
                                          //   height: 12.h,
                                          // ),
                                          // Row(
                                          //   children: [
                                          //     RatingBar.builder(
                                          //       initialRating: rating,
                                          //       minRating: 1,
                                          //       direction: Axis.horizontal,
                                          //       allowHalfRating: true,
                                          //       itemCount: 5,
                                          //       itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                                          //       itemBuilder: (context, _) => Icon(
                                          //         Icons.star,
                                          //         color: Colors.amber,
                                          //         size: 20.sp,
                                          //       ),
                                          //       onRatingUpdate: (value) {},
                                          //       itemSize: 15.sp,
                                          //     ),
                                          //     SizedBox(
                                          //       width: 3.w,
                                          //     ),
                                          // customTextRegular(
                                          //   title: review,
                                          //   fontSize: 14.sp,
                                          //   fontWeight: FontWeight.w400,
                                          //   color: AppColors.blackb3,
                                          // ),
                                          // ],
                                          // ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
