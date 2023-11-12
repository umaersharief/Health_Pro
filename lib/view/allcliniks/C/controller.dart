import 'package:get/get.dart';
import 'package:health_pro/view/Homepage/C/controller.dart';
import 'package:health_pro/view/Homepage/M/allclinics_model.dart';

class AllClinikCOntroller extends GetxController {
  static AllClinikCOntroller get my => Get.find();
  String querry = '';

  List<ClinikData> filterscliicsModel = [];
  void firstdataload(context) {
    if (HomeController.my.allClinicsModel != null) {
      filterscliicsModel = HomeController.my.allClinicsModel!.data!;
    }
  }

  void getfiltercliniks(context) {
    if (HomeController.my.allClinicsModel != null) {
      filterscliicsModel = HomeController.my.allClinicsModel!.data!
          .where((cliniks) =>
              querry.isEmpty ||
              querry == '' ||
              (cliniks.name ?? "").toLowerCase().contains(querry.toLowerCase()))
          .toList();
      update();
    } else {
      // Handle the case when the data structure is not as expected
    }
  }
}
