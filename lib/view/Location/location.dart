import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_pro/utils/app_colors.dart';

import '../../utils/app_images.dart';
import '../widgets/widgets/custom_text.dart';

class Locationscreen extends StatelessWidget {
  final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(33.6517829, 73.0823911), zoom: 14.4746);

  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(33.6517829, 73.0823911),
        infoWindow: InfoWindow(title: 'The title of the marker'))
  ];

  Locationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            markers: Set<Marker>.of(_markers),
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
                  contentPadding: EdgeInsets.symmetric(vertical: 6),
                  hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff747474)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
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
            child: Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 25),
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
                      title: 'Asian Medical Center',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cardcolor,
                    ),
                    customTextRegular(
                      title: 'Lorem ipsum dolor sit amet, connected',
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.redb3color,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.cardcolor,
                          size: 15,
                        ),
                        customTextRegular(
                          title: 'Doha, Qatar',
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.cardcolor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
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
                          title: '4',
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
