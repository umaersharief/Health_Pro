import 'package:get/get.dart';
import 'package:health_pro/view/ClinicsDetails/M/clinicsdetails_model.dart';
import 'package:health_pro/view/Homepage/C/controller.dart';

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
      print(
          "provider.allClinicsModel[0].data   ${HomeController.my.allClinicsModel!.data!.length} ");
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
