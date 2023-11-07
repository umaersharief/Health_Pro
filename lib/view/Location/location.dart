import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/ClinicsDetails/M/clinicsdetails_model.dart';

import '../../utils/app_images.dart';
import '../widgets/widgets/custom_text.dart';

class Locationscreen extends StatelessWidget {
  ClinikData? clinikData;

  Locationscreen({super.key, required this.clinikData});

  @override
  Widget build(BuildContext context) {
    // log("clinikData!.latitude ${clinikData!.latitude}    OR     clinikData!.longitude ${clinikData!.longitude} ");
    const CameraPosition kGooglePlex =
        CameraPosition(target: LatLng(29.418068, 71.670685), zoom: 14.4746);
    // final List<Marker> markers = <Marker>[
    //   Marker(
    //       markerId: const MarkerId('1'),
    //       position: LatLng(clinikData!.latitude ?? 29.418068,
    //           clinikData!.longitude ?? 71.670685),
    //       infoWindow: const InfoWindow(title: 'The title of the marker'))
    // ];
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: kGooglePlex,
            // markers: Set<Marker>.of(markers),
            mapType: MapType.hybrid,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.20),
          ),
          Positioned(
            left: 20,
            top: 45,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.dividercolor,
                size: 30.sp,
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 30,
            child: SizedBox(
              width: 327.w,
              height: 48.h,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.dividercolor,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 24.sp,
                    color: AppColors.cardcolor,
                  ),
                  hintText: 'Search...',
                  contentPadding: const EdgeInsets.symmetric(vertical: 6),
                  hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff747474)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.dividercolor,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.pic1),
                  radius: 30,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customTextRegular(
                      title: "${clinikData!.name}",
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cardcolor,
                    ),
                    customTextRegular(
                      title: "${clinikData!.description}",
                      overflow: TextOverflow.ellipsis,
                      maxlines: 2,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.redb3color,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.cardcolor,
                          size: 15,
                        ),
                        customTextRegular(
                          title: "${clinikData!.area}",
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cardcolor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: clinikData!.averageReviews!.toDouble(),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (value) {},
                          itemSize: 15.sp,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        customTextRegular(
                          title: clinikData!.totalReviews!.toString(),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackb3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
