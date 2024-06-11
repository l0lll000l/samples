import 'package:flutter/material.dart';
import 'package:flutter_application_16/controller/dataController.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final controller = Get.put(dataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('GetX API'),
      ),
      body: Container(
        child: Obx(() {
          var data = controller.datamodel.value;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.category.toString()),
                Text(data.description.toString()),
                Text(data.id.toString()),
                Text(data.image.toString()),
                Text(data.title.toString()),
                Text(data.rating!.count.toString() != null
                    ? data.rating!.count.toString()
                    : 'no data'),
                Text(data.rating!.rate.toString() != null
                    ? data.rating!.rate.toString()
                    : 'no data'),
              ],
            ),
          );
        }),
      ),
    );
  }
}
