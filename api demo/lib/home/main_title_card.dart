import 'dart:developer';

import 'package:apidemo/applications/bloc/trending_bloc.dart';
import 'package:apidemo/home/main_card.dart';
import 'package:apidemo/main_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:apidemo/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTitleCard extends StatelessWidget {
  final String title;
  final image3;
  const MainTitleCard({
    super.key,
    required this.title,
    this.image3,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<TrendingBloc>(context).add(const GetTrendingImage());
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TrendingBloc, TrendingState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.trending!.length,
                  itemBuilder: (context, index) {
                    final movie = state.trending![index];

                    // log(movie.toString());

                    return MainCard1(
                      key: key,
                      image2: imageurl1,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
