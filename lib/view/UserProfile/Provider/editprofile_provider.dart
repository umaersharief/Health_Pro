import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/app_constant.dart';
import '../../../utils/app_urls.dart';
import '../getuserprofile.dart';

class EdittProfileProvider extends ChangeNotifier {
  String? schmID;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  //image picker
  File? imageFile;
  getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Get from Camera
  getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> updateUserProfile({
    BuildContext? context,
    required String name,
    required String phone,
    required String id,
  }) async {
    updateValue(load: true);
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse(AppUrls.baseUrl + AppUrls.editprofile));

      request.headers['Authorization'] = 'Bearer ${AppConstant.getUserToken}';
      // request.headers['Content-Type'] = 'application/json';

      request.fields.addAll({'name': name, 'phone': phone,'id_number':id});

      if (imageFile != null) {
        request.files
            .add(await http.MultipartFile.fromPath('image', imageFile!.path));
      }
      var response = await request.send();
      // ignore: avoid_print
      print(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        updateValue(load: false);
        AppConstant.showCustomSnackBar("Profile Updated", isError: false);
        Get.to(() => const GetUserProfile());
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);

      print("this is error ");
    }
  }
}
