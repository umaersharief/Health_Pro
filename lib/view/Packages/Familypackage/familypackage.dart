import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Homepage/M/allschemes_model.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_button.dart';

import '../../Contactus/familycontact.dart';

// ignore: must_be_immutable
class Familypackage extends StatelessWidget {
  DataPlan dataPlan;
  Familypackage({super.key, required this.dataPlan});
  // List<MyWidget> mylist = [
  //   MyWidget(
  //     color: const Color(0xffDEEAFF),
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: 'Adult',
  //     rowtitle2: '2',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: '2 Children<12',
  //     rowtitle2: '2',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: '2 Children<12',
  //     rowtitle2: '2',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: '3Children',
  //     rowtitle2: '1',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle2: '1',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: simpleappbar(
        text: 'Family Package',
        elevation: 0.0,
        backgorundcolor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.cardcolor,
        child:
            //  TwoDimensionalGridView(
            //   diagonalDragBehavior: DiagonalDragBehavior.free,
            //   delegate: TwoDimensionalChildBuilderDelegate(
            //       maxXIndex: 9,
            //       maxYIndex: 9,
            //       builder: (BuildContext context, ChildVicinity vicinity) {
            //         return Container(
            //           color: vicinity.xIndex.isEven && vicinity.yIndex.isEven
            //               ? Colors.amber[50]
            //               : (vicinity.xIndex.isOdd && vicinity.yIndex.isOdd
            //                   ? Colors.purple[50]
            //                   : null),
            //           height: 200,
            //           width: 200,
            //           child: Center(
            //               child: Text(
            //                   'Row ${vicinity.yIndex}: Column ${vicinity.xIndex}')),
            //         );
            //       }),
            // ),

            Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(200),
                      1: FixedColumnWidth(200),
                      2: FixedColumnWidth(200),
                      3: FixedColumnWidth(200),
                      4: FixedColumnWidth(200),
                      5: FixedColumnWidth(200),
                    },
                    border:
                        TableBorder.all(color: Colors.transparent, width: 5),
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color(0xffDEEAFF),
                          border: Border(
                            left: BorderSide(color: Colors.grey, width: 2),
                            right: BorderSide(color: Colors.grey, width: 2),
                            bottom: BorderSide(
                                color: AppColors.cardcolor, width: 7),
                          ),
                        ),
                        children: [
                          Container(
                              height: height * 0.08,
                              child: Center(
                                child: Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                          Container(
                              height: height * 0.08,
                              child: Center(
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Container(
                              height: height * 0.08,
                              child: Center(
                                child: Text(
                                  'Plan',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Container(
                              height: height * 0.08,
                              child: Center(
                                child: Text(
                                  'Actual Rate',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Container(
                              height: height * 0.08,
                              child: Center(
                                child: Text(
                                  'Discounted Rate',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                          Container(
                              height: height * 0.08,
                              child: Center(
                                child: Text(
                                  'Final Rate',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ],
                      ),
                      ...List.generate(
                          dataPlan.lists!.length,
                          (index) => TableRow(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    left: BorderSide(
                                        color: Colors.grey, width: 2),
                                    right: BorderSide(
                                        color: Colors.grey, width: 2),
                                    bottom: BorderSide(
                                        color: AppColors.cardcolor, width: 7),
                                  ),
                                ),
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.03,
                                          vertical: height * 0.03),
                                      child: Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          dataPlan.lists![index].title
                                              .toString(),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.03,
                                          vertical: height * 0.03),
                                      child: Text(
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          dataPlan.lists![index].quantity
                                              .toString(),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03,
                                        vertical: height * 0.03),
                                    child: Text(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        dataPlan.lists![index].plan!.name
                                            .toString(),
                                        textAlign: TextAlign.center),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03,
                                        vertical: height * 0.03),
                                    child: Text(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        "QAR ${dataPlan.lists![index].actualRate.toString()}",
                                        textAlign: TextAlign.center),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03,
                                        vertical: height * 0.03),
                                    child: Text(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        "QAR ${dataPlan.lists![index].discountedRate.toString()}",
                                        textAlign: TextAlign.center),
                                  )),
                                  Center(
                                      child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03,
                                        vertical: height * 0.03),
                                    child: Text(
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        "QAR ${dataPlan.lists![index].finalRate.toString()}",
                                        textAlign: TextAlign.center),
                                  )),
                                ],
                              ))
                    ],
                  ),
                ),
              ),
              customButton(
                color: AppColors.dividercolor,
                text: 'Contact Us',
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontColor: AppColors.cardcolor,
                ontap: () {
                  Get.to(() => const FamilyContact());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
