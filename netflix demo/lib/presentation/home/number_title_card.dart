import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/bloc/trending_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<TrendingBloc>(context).add(const GetTrendingImage());
    });
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const MainTitle(
        title: 'top 10 tv shows in india',
      ),
      kHeight,
      LimitedBox(
          maxHeight: 200,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<TrendingBloc, TrendingState>(
                builder: (context, state) {
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(10, (index) {
                        final movie = state.trending![index];
                        return NumberCard(
                          index: index,
                          image: '$imageAppendurl${movie.posterPath}',
                        );
                      }));
                },
              )))
    ]);
  }
}
