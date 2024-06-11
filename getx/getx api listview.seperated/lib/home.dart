import 'package:flutter/material.dart';
import 'package:flutter_application_16/controller/dataController.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final Controller = Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('GetX API'),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Obx(
                () {
                  final data;
                  if (Controller.dataModel.value != null) {
                    data = Controller.dataModel.value;
                  } else {
                    data = [];
                  }

                  final newData = data.results![index];

                  return ListTile(
                    subtitle: Text(newData.overview),
                    title: Text(newData.originalTitle),
                  );
                },
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: 15));
  }
}
