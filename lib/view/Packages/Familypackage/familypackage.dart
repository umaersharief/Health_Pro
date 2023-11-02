import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/Packages/components/packagecomponent.dart';
import 'package:health_pro/view/Packages/components/iconcontainer.dart';
import 'package:health_pro/view/widgets/widgets/custom_appbars.dart';
import 'package:health_pro/view/widgets/widgets/custom_button.dart';

import '../../Contactus/familycontact.dart';

// ignore: must_be_immutable
class Familypackage extends StatelessWidget {
  Familypackage({super.key});
  List<MyWidget> mylist = [
    MyWidget(
      color: const Color(0xffDEEAFF),
    ),
    MyWidget(
      haverow: true,
      rowtitle1: 'Adult',
      rowtitle2: '2',
    ),
    MyWidget(
      haverow: true,
      rowtitle1: '2 Children<12',
      rowtitle2: '2',
    ),
    MyWidget(
      haverow: true,
      rowtitle1: '2 Children<12',
      rowtitle2: '2',
    ),
    MyWidget(
      haverow: true,
      rowtitle1: '>3Children',
      rowtitle2: '1',
    ),
    MyWidget(
      haverow: true,
      rowtitle2: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
}
