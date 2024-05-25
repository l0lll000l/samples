import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class VideoWidget extends StatelessWidget {
  final String image1;
  const VideoWidget({super.key, required this.image1});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            image1,
            fit: BoxFit.cover,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off,
                color: kwhite,
              )),
        )
      ],
    );
  }
}
