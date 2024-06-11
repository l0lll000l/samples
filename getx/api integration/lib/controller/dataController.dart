import 'package:flutter_application_16/model/dataModel.dart';
import 'package:flutter_application_16/services/dataServices.dart';
import 'package:get/get.dart';

class dataController extends GetxController {
  //create instance
  Rx<Datamodel> datamodel = Datamodel().obs;
  getData() async {
    try {
      var data = await Dataservices().getServices();
      if (data != null) {
        datamodel.value = data;
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
