import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/bloc/trending_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/main_card.dart';

class Background_card extends StatelessWidget {
  final image;
  const Background_card({
    super.key,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(image))),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //************************************************************** */
              TextButton.icon(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: kwhite,
                  ),
                  label: const Text(
                    'My List',
                    style: TextStyle(color: kwhite, fontSize: 20),
                  )),
              //************************************************************** */
              TextButton.icon(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_arrow,
                    color: kwhite,
                  ),
                  label: const Text(
                    'play',
                    style: TextStyle(color: kwhite, fontSize: 20),
                  )),
              //************************************************************** */
              TextButton.icon(
                  style: const ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info,
                    color: kwhite,
                  ),
                  label: const Text(
                    'info',
                    style: TextStyle(color: kwhite, fontSize: 20),
                  )),
              //************************************************************** */
            ],
          ),
        ),
      ],
    );
  }
}
