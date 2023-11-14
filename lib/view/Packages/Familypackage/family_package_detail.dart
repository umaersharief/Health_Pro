import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_pro/view/ClinicsDetails/components/doctorcomp.dart';
import 'package:health_pro/view/Homepage/M/allschemes_model.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';

import '../../../utils/app_colors.dart';

class FamilyPackageDetail extends StatelessWidget {
  final Lists familyPackageList;
  const FamilyPackageDetail({super.key, required this.familyPackageList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleappbar(
        text: 'Family Package Detail',
        elevation: 0.0,
        backgorundcolor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.cardcolor,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: const {
                      0: FixedColumnWidth(100),
                      1: FixedColumnWidth(100),
                      2: FixedColumnWidth(100),
                      3: FixedColumnWidth(100),
                      4: FixedColumnWidth(100),
                    },
                    border: TableBorder.all(color: Colors.grey, width: 2),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                        ),
                        children: const [
                          Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Quantity',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Category',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Actual Rate',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Discounted Rate',
                              textAlign: TextAlign.center,
                            ),
                          )),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Final Rate',
                              textAlign: TextAlign.center,
                            ),
                          )),
                        ],
                      ),
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(color: Colors.grey, width: 2),
                            right: BorderSide(color: Colors.grey, width: 2),
                            bottom: BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(familyPackageList.quantity.toString(),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(familyPackageList.plan!.name.toString(),
                                textAlign: TextAlign.center),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(familyPackageList.actualRate.toString(),
                                textAlign: TextAlign.center),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                familyPackageList.discountedRate.toString(),
                                textAlign: TextAlign.center),
                          )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(familyPackageList.finalRate.toString(),
                                textAlign: TextAlign.center),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: familyPackageList.length,
              //   itemBuilder: (context, index) => Doctorcomp(
              //     image: 'AppImages.d1',
              //     name: familyPackageList[index].title.toString(),
              //     specilist: familyPackageList[index].quantity.toString(),
              //   ),
              // ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
