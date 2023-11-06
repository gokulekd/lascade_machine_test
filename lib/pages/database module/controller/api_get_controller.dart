import 'dart:developer';

import 'package:get/get.dart';
import 'package:lascade_machine_test/pages/database%20module/Api/get_api.dart';
import 'package:lascade_machine_test/pages/database%20module/model/data_model.dart';

class ApiController extends GetxController {
  final ApiService _apiService = ApiService();


  List<DataModel> apiData = [];
  RxBool isDataLoading = false.obs;

  Future<void> fetchData() async {
    try {
      isDataLoading.value = true;
      final response = await _apiService.fetchData();
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the response data into your model
        final parsedData = DataModel.fromJson(response.data);
        apiData.add(parsedData);
        log(apiData.length.toString());
         isDataLoading.value = false;
      } else {
        isDataLoading.value = false;
        // Handle API error
      }
    } catch (e) {
      isDataLoading.value = false;

      // Handle other exceptions, e.g., network errors
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }
}
