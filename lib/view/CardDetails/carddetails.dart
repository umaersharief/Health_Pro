import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/utils/app_images.dart';
import 'package:health_pro/view/CardDetails/Provider/pandetails_provider.dart';
import 'package:health_pro/view/CardDetails/components/placecomponent.dart';
import 'package:health_pro/view/widgets/widgets/custom_button.dart';
import 'package:health_pro/view/widgets/widgets/custom_text.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';
import '../Cardregistration/Provider/cardregister_provider.dart';
import '../Cardregistration/cardregistration.dart';

// ignore: must_be_immutable
class CardDetails extends StatefulWidget {
  String cardtype;

  CardDetails({super.key, this.cardtype = 'Individual Care Card'});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  int activeindex = 0;
  int nextind = 0;
  List<String> texts = [
    'Silver Plan',
    'Gold Plan',
    'Bronze Plan',
    'AL Maha Plan',
    'Pearl Plan'
  ];
  List<String> images = [
    AppImages.silvercard,
    AppImages.goldcard,
    AppImages.bronzecard,
    AppImages.corporatecard,
    AppImages.pearlcard
  ];

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 100), () {
      Provider.of<PlanDetailsProvider>(context, listen: false)
          .getPlanbyID()
          .then((value) {
        _data = List.generate(value ?? 0, (i) => i);
        totalPage = _data.length % _perPage == 0
            ? int.parse((_data.length / _perPage).toString())
            : int.parse((_data.length / _perPage).toString().split('.').first) +
                1;
        setState(() {});
      });
    });

    super.initState();
  }

  List<int> _data = [];
  int _page = 0; // default page to 0
  final int _perPage = 3; //

  var dataToShow = [];
  int totalPage = 0;

  @override
  Widget build(BuildContext context) {
    int from = 0;
    int to = 0;

    if (((_page * _perPage) + _perPage) < _data.length) {
      from = (_page * _perPage);
      to = ((_page * _perPage) + _perPage);
    } else {
      from = (_page * _perPage);
      to = _data.length;
    }
    debugPrint('from $from');
    debugPrint('to $to');
    debugPrint('totalPage $totalPage');

    dataToShow = _data.sublist(from, to); //
    return Scaffold(
      body: SafeArea(
        child: Consumer<PlanDetailsProvider>(
          builder: (context, plandetails, child) {
            return plandetails.palnDetailsModel.isEmpty || totalPage == 0
                ? SpinKitCircle(
                    color: AppColors.primaryblue,
                    size: 20.sp,
                  )
                : Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: double.infinity,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                    left: 20.w, right: 20.w, top: 20.h),
                                height: 240.h,
                                decoration: BoxDecoration(
                                    color: AppColors.cardcolor,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(24.0.r),
                                        bottomRight: Radius.circular(24.0.r))),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () => Get.back(),
                                          icon: Icon(
                                            Icons.arrow_back,
                                            size: 20.sp,
                                            color: AppColors.dividercolor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        customTextRegular(
                                          title:
                                              "${plandetails.palnDetailsModel[0].data!.type}",
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                          textAlign: TextAlign.center,
                                          color: AppColors.dividercolor,
                                        ),
                                      ],
                                    ),
                                    customTextRegular(
                                      title:
                                          "${plandetails.palnDetailsModel[0].data!.name}",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                      color: AppColors.dividercolor,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 194.h,
                                  width: 334.w,
                                  margin: const EdgeInsets.only(top: 100),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.r),
                                    color: AppColors.dividercolor,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "${plandetails.palnDetailsModel[0].data!.image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.cardcolor,
                              border: Border.all(),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: ListView.builder(
                                    // itemCount: plandetails.palnDetailsModel[0].data!.clinics!.total,
                                    itemCount: dataToShow.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var item = plandetails
                                          .palnDetailsModel[0]
                                          .data!
                                          .clinics!
                                          .data![dataToShow[index]];

                                      return Placecomponent(
                                        image: "${item.logo}",
                                        title: "${item.name}",
                                        decription: "${item.description}",
                                        address: "${item.area}",
                                        star: item.totalReviews!.toDouble(),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                NumberPaginator(
                                  config: NumberPaginatorUIConfig(
                                    // default height is 48
                                    height: 45,

                                    buttonShape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    // buttonSelectedForegroundColor: Colors.white,
                                    // buttonUnselectedForegroundColor: Colors.white,
                                    buttonUnselectedBackgroundColor:
                                        Colors.white,
                                    // buttonSelectedBackgroundColor: Colors.white,
                                  ),
                                  numberPages: totalPage,
                                  onPageChange: (int index) {
                                    debugPrint('onPageChange -- $index');
                                    setState(() {
                                      _page = index;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: customButton(
                                    borderRadius: 24.r,
                                    height: 46.h,
                                    color: Colors.white,
                                    text: 'Order Now',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontColor: AppColors.cardcolor,
                                    ontap: () => Get.to(() => CardRegistration(
                                        Provider.of<CareCardRegiterProvider>(
                                                    context,
                                                    listen: false)
                                                .planID =
                                            plandetails
                                                .palnDetailsModel[0].data!.id
                                                .toString())),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}
