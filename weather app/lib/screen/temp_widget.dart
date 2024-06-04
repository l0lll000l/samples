import 'package:flutter/material.dart';
import 'package:flutter_application_5/utilities/apptext.dart';

class TempWidget extends StatelessWidget {
  final title;
  final image;
  final temp;
  const TempWidget(
      {super.key,
      this.temp = '21c',
      this.image = 'assets/img/temperature-high.png',
      this.title = 'Temp Max'});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image(image: AssetImage(image), height: 55),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(data: title, color: Colors.white),
            AppText(data: '$temp ', color: Colors.white)
          ])
    ]);
  }
}
