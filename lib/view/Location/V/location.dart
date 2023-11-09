import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_pro/utils/app_colors.dart';
import 'package:health_pro/view/ClinicsDetails/M/singleclinik_model.dart';
import 'package:health_pro/view/Location/C/controller.dart';

import '../../../utils/app_images.dart';
import '../../widgets/widgets/custom_text.dart';

class Locationscreen extends StatelessWidget {
  SingleClinikData? clinikData;

  Locationscreen({super.key, required this.clinikData});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    log("clinikData!.latitude ${clinikData!.latitude}    OR     clinikData!.longitude ${clinikData!.longitude} ");
    CameraPosition kGooglePlex = CameraPosition(
      zoom: 18,
      target: LatLng(clinikData!.latitude!, clinikData!.longitude!),
    );

    final BitmapDescriptor customMarkerIcon =
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    final List<Marker> markers = <Marker>[
      Marker(
          icon: customMarkerIcon,
          markerId: const MarkerId('1'),
          position: LatLng(clinikData!.latitude!, clinikData!.longitude!),
          infoWindow: InfoWindow(title: "${clinikData!.name}"))
    ];
    return Scaffold(
      body: GetBuilder<LocationController>(initState: (state) {
        Get.put(LocationController());

        LocationController.my.currentlocation();
        LocationController.my.livelistenLocation(context);
      }, builder: (obj) {
        return SizedBox(
          height: height,
          width: width,
          child: obj.currentPosition == null
              ? Center(
                  child: SpinKitCircle(
                  color: Colors.white,
                  size: 20.sp,
                ))
              : Stack(
                  children: [
                    GoogleMap(
                      onTap: (argument) {
                        obj.clearSelectedLocation();
                      },
                      zoomControlsEnabled: true,
                      onMapCreated: (controller) {
                        if (!obj.mapController.isCompleted) {
                          obj.mapController.complete(controller);
                        }
                      },
                      mapType: obj.mapType,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      initialCameraPosition: kGooglePlex,
                      markers: Set<Marker>.of(markers),
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.20),
                    ),
                    Positioned(
                      left: 20,
                      top: 35,
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.primaryblue,
                          size: 30.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      left: 43,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.white,
                          ),
                          child: ListTile(
                            onTap: () {
                              obj.clearSelectedLocation();
                              obj.initialPosition(LatLng(clinikData!.latitude!,
                                  clinikData!.longitude!));
                            },
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
                                      initialRating: clinikData!.averageReviews!
                                          .toDouble(),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 2.0),
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
                                      title:
                                          clinikData!.totalReviews!.toString(),
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
                    ),
                    Positioned(
                      top: height * 0.4,
                      left: width * 0.8,
                      child: FloatingActionButton(
                        heroTag: "btn3",
                        onPressed: () {
                          obj.clearSelectedLocation();
                          obj.mapTypeChange();
                        },
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.map,
                          size: 23.0,
                          color: AppColors.cardcolor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.5,
                      left: width * 0.8,
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        onPressed: () {
                          obj.clearSelectedLocation();
                          obj.initialPosition(obj.movingCurrentLocation!);
                        },
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        backgroundColor: Colors.white,
                        child: const Icon(
                          Icons.my_location_sharp,
                          size: 23.0,
                          color: AppColors.cardcolor,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 85,
                      left: 30,
                      child: SizedBox(
                        width: 327.w,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 327.w,
                              height: 48.h,
                              child: TextField(
                                onChanged: (value) => obj.searchPlaces(value),
                                onTap: () => obj.clearSelectedLocation(),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      width: 1.5.w,
                                      color: AppColors.primaryblue,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: AppColors.dividercolor,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    size: 24.sp,
                                    color: AppColors.cardcolor,
                                  ),
                                  hintText: 'Search...',
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 6),
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
                            if (obj.searchResults != null &&
                                obj.searchResults!.isNotEmpty)
                              if (obj.searchResults != null)
                                Card(
                                  elevation: 10,
                                  color: Colors.white,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: obj.searchResults!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                            obj.searchResults![index]
                                                .description!,
                                            style: const TextStyle(
                                              color: AppColors.primaryblue,
                                            ),
                                          ),
                                          onTap: () {
                                            obj.setSelectedLocation(obj
                                                .searchResults![index]
                                                .placeId!);
                                          },
                                        );
                                      }),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
