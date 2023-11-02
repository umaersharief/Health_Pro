import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Packages/components/packagecomponent.dart';
import 'package:health_pro/view/Packages/components/iconcontainer.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_button.dart';

import '../../Contactus/teamcontact.dart';

// ignore: must_be_immutable
class Teampackage extends StatelessWidget {
  Teampackage({super.key});
  List<MyWidget> mylist = [
    MyWidget(
      color: Color(0xffDEEAFF),
    ),
    MyWidget(
      haverow: true,
      rowtitle1: 'Above 10',
      rowtitle2: '10',
    ),
    MyWidget(
      haverow: true,
      rowtitle1: 'Above 10',
      rowtitle2: '10',
    ),
    MyWidget(
      haverow: true,
      rowtitle1: 'Above 20',
      rowtitle2: '20',
    ),
    MyWidget(
      haverow: true,
      rowtitle1: 'Above 20',
      rowtitle2: '20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
              Iconcontainer(),
              SizedBox(
                height: 19.h,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return mylist[index];
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 5.h,
                        ),
                    itemCount: mylist.length),
              ),
              Container(
                  margin: EdgeInsets.only(right: 20),
                  child: customButton(
                    color: AppColors.dividercolor,
                    text: 'Contact Us',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: AppColors.cardcolor,
                    ontap: () {
                      Get.to(() => TeamContact());
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
