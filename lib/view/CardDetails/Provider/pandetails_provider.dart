import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:health_pro/APIClient/api_service.dart';
import '../Model/plandetails_model.dart';

class PlanDetailsProvider extends ChangeNotifier {
  List<int> data = [];
  int page = 0;
  final int perPage = 3; //

  var dataToShow = [];
  int totalPage = 0;
  bool _loading = false;
  bool get loading => _loading;

  Future<void> updateValue({required bool load}) async {
    _loading = load;
    notifyListeners();
  }

  ApiService apiService = ApiService();

  List<PlanDetailsModel> palnDetailsModel = [];
  Future<int?> getPlanbyID(String? planID) async {
    updateValue(load: true);
    try {
      final response = await apiService.getPlansbyID(planID: planID.toString());
      if (response.statusCode == 200) {
        palnDetailsModel.clear();
        Map<String, dynamic> map = jsonDecode(response.toString());
        palnDetailsModel.add(PlanDetailsModel.fromJson(map));
        notifyListeners();

        return palnDetailsModel.first.data?.clinics?.total;
      } else {
        updateValue(load: false);
      }
    } catch (error) {
      updateValue(load: false);
      // ignore: avoid_print
      print("this is error   $error ");
    }
    return null;
  }

  Future givepagination(context, String? planID) async {
    Future.delayed(const Duration(milliseconds: 100), () {
      getPlanbyID(planID).then((value) {
        data = List.generate(value ?? 0, (i) => i);
        totalPage = data.length % perPage == 0
            ? int.parse((data.length / perPage).toString())
            : int.parse((data.length / perPage).toString().split('.').first) +
                1;

        int from = 0;
        int to = 0;

        if (((page * perPage) + perPage) < data.length) {
          from = (page * perPage);
          to = ((page * perPage) + perPage);
        } else {
          from = (page * perPage);
          to = data.length;
        }
        debugPrint('from $from');
        debugPrint('to $to');
        debugPrint('totalPage $totalPage');

        dataToShow = data.sublist(from, to);
        notifyListeners();
      });
    });
  }
}
