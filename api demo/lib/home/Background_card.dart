import 'package:apidemo/constant/constant.dart';
import 'package:flutter/material.dart';

class Background_card extends StatelessWidget {
  const Background_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(kimage1))),
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
