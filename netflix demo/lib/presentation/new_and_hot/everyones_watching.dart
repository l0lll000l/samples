import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/widgets/video_widget.dart';

class EveryOnesWatching extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryOnesWatching(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          movieName,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(description),
        kHeight,
        VideoWidget(
          image1: posterPath,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
                label: Text(
                  'My List',
                  style: TextStyle(color: kwhite, fontSize: newAndHotIconFont),
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
                label: Text(
                  'play',
                  style: TextStyle(color: kwhite, fontSize: newAndHotIconFont),
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
                label: Text(
                  'info',
                  style: TextStyle(color: kwhite, fontSize: newAndHotIconFont),
                )),
          ],
        )
      ],
    );
  }
}
