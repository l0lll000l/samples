import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/bloc/trending_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/main_title.dart';
import 'package:netflix/presentation/home/main_card.dart';

class TrendingCard extends StatelessWidget {
  final String Title;
  const TrendingCard({
    super.key,
    required this.Title,
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
          title: Title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TrendingBloc, TrendingState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.trending!.isEmpty) {
                  return const Center(
                    child: Text('list is empty'),
                  );
                } else {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(10, (index) {
                      final movie = state.trending![index];

                      return MainCard1(
                        image: '$imageAppendurl${movie.posterPath}',
                      );
                    }),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
