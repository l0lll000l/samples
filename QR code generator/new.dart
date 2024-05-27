import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class New extends StatelessWidget {
  const New({super.key, this.controller});
  final controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('generate qr code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              QrImageView(
                data: controller,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
