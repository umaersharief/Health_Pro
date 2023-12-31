import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Homepage/M/allschemes_model.dart';
import 'package:health_pro/view/Packages/components/packagecomponent.dart';
import 'package:health_pro/view/Packages/components/iconcontainer.dart';
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
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, bottom: 25.h),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              // const Iconcontainer(),
              SizedBox(
                height: 19.h,
              ),
              MyWidget(
                color: const Color(0xffDEEAFF),
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showBottomSheet(
                              context, height, width, dataPlan.lists![index]);
                        },
                        child: MyWidget(
                          haverow: true,
                          rowtitle1: dataPlan.lists![index].title!,
                          rowtitle2: dataPlan.lists![index].quantity!,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 5.h,
                        ),
                    itemCount: dataPlan.lists!.length),
              ),
              Container(
                  margin: EdgeInsets.only(right: 20.w),
                  child: customButton(
                    color: AppColors.dividercolor,
                    text: 'Contact Us',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.cardcolor,
                    ontap: () {
                      Get.to(() => const FamilyContact());
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void showBottomSheet(context, height, width, Lists list) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                  width: width * 0.2,
                  child: Image(
                    fit: BoxFit.contain,
                    image: NetworkImage(
                      list.plan!.image!,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${list.title}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Quantity: ${list.quantity}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Actual rate: ${list.actualRate} QAR',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Discounted rate: ${list.discountedRate} QAR',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Final rate: ${list.finalRate} QAR',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Plan',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: height * 0.1,
                            width: width * 0.2,
                            child: Image(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                list.plan!.image!,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${list.plan!.name}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Type: ${list.plan!.type}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Price: ${list.plan!.price}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
