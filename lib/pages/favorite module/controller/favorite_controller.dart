import 'dart:developer';

import 'package:get/get.dart';
import 'package:lascade_machine_test/pages/database%20module/model/data_model.dart';

class FavoriteController extends GetxController {
  RxList<Result> dataList = <Result>[].obs;

  void addData(Result data) {
    dataList.add(data);
    log("data added");
  }

  void removeData(Result data) {
    for (var i = 0; i < dataList.length; i++) {
      if (dataList[i].title == data.title ||
          dataList[i].imageUrl == data.imageUrl ||
          dataList[i].description == data.description) {
        dataList.removeAt(i);
       
      }
    }
      log("data removed");
  }
}
