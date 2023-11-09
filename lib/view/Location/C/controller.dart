import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_pro/view/Location/M/model.dart' as l;
import 'package:health_pro/view/Location/S/place_service.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  static LocationController get my => Get.find();
  LocationData? locationData;
  StreamSubscription? locationSubscription;
  Location locationloc = Location();
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  LatLng? movingCurrentLocation;
  MapType mapType = MapType.normal;
  LatLng? currentPosition;
  void currentlocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {}
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {}
    }
    locationData = await location.getLocation();
    currentPosition = LatLng(locationData!.latitude!, locationData!.longitude!);
    update();
  }

  void initialPosition(LatLng latLng) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 18.00,
        ),
      ),
    );
    update();
  }

  void mapTypeChange() {
    mapType = mapType == MapType.normal ? MapType.satellite : MapType.normal;
    update();
  }

  void livelistenLocation(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      locationSubscription =
          locationloc.onLocationChanged.handleError((onError) {
        locationSubscription!.cancel();
        locationSubscription = null;
        update();
      }).listen((event) async {
        // getdrivers(context);
        movingCurrentLocation = LatLng(event.latitude!, event.longitude!);

        update();
      });
      update();
    });
  }

// search work
  List<l.PlaceSearch>? searchResults;

  final placesService = PlacesService();

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    update();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    initialPosition(LatLng(sLocation.geometry!.location!.lat!,
        sLocation.geometry!.location!.lng!));
    searchResults = null;
    update();
  }

  clearSelectedLocation() {
    searchResults = null;
    update();
  }
}
