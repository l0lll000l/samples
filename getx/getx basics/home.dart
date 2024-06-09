import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:snackbar/tapController.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Tapcontroller controller = Get.put(Tapcontroller());

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //----------------------------------------------------------------------------------------------------------
            GestureDetector(
              onTap: () {
                controller.increaseX();
              },
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  'icrement',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
                width: double.maxFinite,
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),
            //----------------------------------------------------------------------------------------------------------

            GetBuilder<Tapcontroller>(
              builder: (controller1) {
                return Text(controller1.x.toString());
              },
            )
          ],
        ),
      ),
    );
  }
}
