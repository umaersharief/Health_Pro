import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import 'package:health_pro/view/Cardregistration/user_plan_registration.dart';
import '../../../../utils/app_constant.dart';

class CareCardRegiterProvider extends ChangeNotifier {
  String? gender = 'Male';
  String? planID;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  Future<UserPlanRegistration?> careCardRegister({
    required String name,
    required String idNumber,
    required String dob,
    required String phone,
    // required String amount,
  }) async {
    print("*****gender ****$gender****  plann id****$planID*****");
    updateValue(load: true);
    try {
      var body = {
        'name': name,
        'id_number': idNumber,
        'dob': dob,
        'phone_no': phone,
        'gender': gender,
        'plan_id': planID,
        'total_payment': "456"
      };
      final response = await apiService.careCardRegister(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");

      if (response.statusCode == 200) {
        // debugPrint('pay url ::${response.data['payurl']}');

        UserPlanRegistration data =
            UserPlanRegistration.fromJson(response.data);

        updateValue(load: false);
        // AppConstant.showCustomSnackBar("Care Card Register Successfully",
        //     isError: false);
        return data;
      } else {
        updateValue(load: false);
        AppConstant.showCustomSnackBar(
            "Some thing went wrong ${'\n'} Please try again",
            isError: true);
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      AppConstant.showCustomSnackBar(
          "Some thing went wrong ${'\n'} Please try again",
          isError: true);
      print("this is error ");
    }
  }

  Future<void> onSuccess({
    required UserPlanRegistration? data,

    // required String amount,
  }) async {
    try {
      var body = {
        "user_plans_id": data?.data?.id,
        "transaction_id": data?.data?.tId
      };
      final response = await apiService.onSuccess(params: body);

      // ignore: avoid_print
      print(
          "***Responce ***${response.statusCode}**********${response.data}*************");

      if (response.statusCode == 200) {
      } else {}
    } catch (error) {}
  }
}
