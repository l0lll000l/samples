import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/main_card.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, this.image});
  final int index;
  final image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
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
          ],
        ),
        Positioned(
            bottom: -30,
            left: 13,
            child: BorderedText(
              strokeColor: kwhite,
              strokeWidth: 10,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                    fontSize: 150, color: kBlack, fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}
