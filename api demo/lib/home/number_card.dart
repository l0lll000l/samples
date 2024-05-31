import 'package:apidemo/applications/bloc/trending_bloc.dart';
import 'package:apidemo/constant/constant.dart';
import 'package:apidemo/home/main_card.dart';
import 'package:bordered_text/bordered_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingBloc, TrendingState>(
      builder: (context, state) {
        return Stack(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 50,
                  height: 150,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: kradius,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageurl1),
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
                        fontSize: 150,
                        color: kBlack,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        );
      },
    );
  }
}
