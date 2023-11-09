import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Homepage/M/allschemes_model.dart';
import 'package:health_pro/view/Packages/components/packagecomponent.dart';
import 'package:health_pro/view/Packages/components/iconcontainer.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_button.dart';

import '../../Contactus/teamcontact.dart';

// ignore: must_be_immutable
class Teampackage extends StatelessWidget {
  DataPlan dataPlan;
  Teampackage({super.key, required this.dataPlan});
  // List<MyWidget> mylist = [
  //   MyWidget(
  //     color: const Color(0xffDEEAFF),
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: 'Above 10',
  //     rowtitle2: '10',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: 'Above 10',
  //     rowtitle2: '10',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: 'Above 20',
  //     rowtitle2: '20',
  //   ),
  //   MyWidget(
  //     haverow: true,
  //     rowtitle1: 'Above 20',
  //     rowtitle2: '20',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: simpleappbar(
        text: 'Team Package',
        elevation: 0.0,
        backgorundcolor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: AppColors.cardcolor,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 25),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              const Iconcontainer(),
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
                          showdialogue(
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
                  margin: const EdgeInsets.only(right: 20),
                  child: customButton(
                    color: AppColors.dividercolor,
                    text: 'Contact Us',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.cardcolor,
                    ontap: () {
                      Get.to(() => const TeamContact());
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void showdialogue(context, height, width, Lists list) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.white,
          content: Stack(
            children: [
              SizedBox(
                height: 500,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                      width: width * 0.2,
                      child: Image(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                          // dataPlan
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
                                    // dataPlan
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
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
