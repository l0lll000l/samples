import 'package:flutter_application_16/model/dataModel.dart';
import 'package:flutter_application_16/services/dataServices.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Rx<DataModel> dataModel = DataModel().obs;
  getData() async {
    try {
      var data = await DataServices().getServices();
      if (data != null) {
        dataModel.value = data;
      }
    } catch (e) {
      Get.snackbar('error', '$e');
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
