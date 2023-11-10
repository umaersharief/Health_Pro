import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/Regcarddetails/components/detailcomponent.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:provider/provider.dart';
import 'Provider/myplan_provider.dart';

// ignore: must_be_immutable
class RegcardDetails extends StatefulWidget {
  String cardimage, planname;
  RegcardDetails(
      {super.key,
      this.cardimage = AppImages.silvercard,
      this.planname = 'Silver Plan'});

  @override
  State<RegcardDetails> createState() => _RegcardDetailsState();
}

class _RegcardDetailsState extends State<RegcardDetails> {
  @override
  void initState() {
    Provider.of<MyPlanProvider>(context, listen: false).getMyPlans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: Consumer<MyPlanProvider>(
          builder: (context, myplanprovider, child) {
            // ignore: prefer_is_empty
            return SizedBox(
              height: height,
              width: width,
              child: myplanprovider.loading
                  ? Center(
                      child:
                          SpinKitCircle(color: AppColors.blueb9, size: 20.sp))
                  : myplanprovider.myplanModel.isEmpty
                      ? const Center(child: Text("No Card is Registered"))
                      : Column(
                          children: [
                            SizedBox(
                              height: 277.h,
                              width: double.infinity,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25.w),
                                    height: 277.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.cardcolor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(24.r),
                                            bottomRight:
                                                Radius.circular(24.r))),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () => Get.back(),
                                              icon: Icon(
                                                Icons.arrow_back,
                                                size: 20.sp,
                                                color: AppColors.dividercolor,
                                              ),
                                            ),
                                            customTextRegular(
                                              title: 'My Care Card',
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.dividercolor,
                                            ),
                                            IconButton(
                                              onPressed: () => Get.back(),
                                              icon: Icon(
                                                Icons.arrow_back,
                                                size: 20.sp,
                                                color: AppColors.cardcolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        customTextRegular(
                                            title:
                                                "${myplanprovider.myplanModel[0].data!.planName}",
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.dividercolor,
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    right: 27,
                                    bottom: -30,
                                    child: Container(
                                      height: 194.h,
                                      width: 334.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(22.r),
                                        color: AppColors.dividercolor,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${myplanprovider.myplanModel[0].data!.planImage}",
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 20.w, right: 20.w, bottom: 20.h),
                              width: 330.w,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              decoration: BoxDecoration(
                                  color: AppColors.cardcolor,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Column(
                                children: [
                                  Detailcomponent(
                                    title: 'Name',
                                    subtitle:
                                        "${myplanprovider.myplanModel[0].data!.name}",
                                  ),
                                  const Divider(
                                    color: Color(0xff3c84a780),
                                    thickness: 2,
                                  ),
                                  Detailcomponent(
                                    title: 'Phone',
                                    subtitle:
                                        "${myplanprovider.myplanModel[0].data!.phone}",
                                  ),
                                  const Divider(
                                    color: Color(0xff3c84a780),
                                    thickness: 2,
                                  ),
                                  Detailcomponent(
                                    title: 'E-Mail',
                                    subtitle:
                                        "${myplanprovider.myplanModel[0].data!.email}",
                                  ),
                                  const Divider(
                                    color: Color(0xff3c84a780),
                                    thickness: 2,
                                  ),
                                  Detailcomponent(
                                    title: 'ID Number',
                                    subtitle:
                                        "${myplanprovider.myplanModel[0].data!.idNumber}",
                                  ),
                                  const Divider(
                                    color: Color(0xff3c84a780),
                                    thickness: 2,
                                  ),
                                  Detailcomponent(
                                    title: 'Dependent',
                                    subtitle:
                                        "${myplanprovider.myplanModel[0].data!.dependent}",
                                  ),
                                  const Divider(
                                    color: Color(0xff3c84a780),
                                    thickness: 2,
                                  ),
                                  Detailcomponent(
                                    title: 'Date of Birth',
                                    subtitle:
                                        "${myplanprovider.myplanModel[0].data!.dob}",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
            );
          },
        )),
      ),
    );
  }
}
