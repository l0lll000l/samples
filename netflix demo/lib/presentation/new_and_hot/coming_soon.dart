import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        IntrinsicHeight(
          child: SizedBox(
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(month,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kgrey)),
                Text(
                  day,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: size.width - 70,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(image1: posterPath),
              Row(
                children: [
                  Text(
                    movieName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_active,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.info,
                    ),
                  ),
                ],
              ),
              kHeight,
              Text('Coming on $day $month'),
              kHeight,
              Text(
                movieName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(description),
              kHeight
            ],
          ),
        ),
      ],
    );
  }
}
