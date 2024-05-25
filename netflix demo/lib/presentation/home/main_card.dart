import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

const imageurl1 =
    "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/eHMh7kChaNeD4VTdMCXLJbRTzcI.jpg";

class MainCard1 extends StatelessWidget {
  final image;
  const MainCard1({
    super.key,
    this.image = imageurl1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kradius,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        height: 300,
        width: 200,
      ),
    );
  }
}
