import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/home/bloc/trending_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/home/background_card.dart';

import 'package:netflix/presentation/home/main/popular_card.dart';
import 'package:netflix/presentation/home/main/trendingCard.dart';
import 'package:netflix/presentation/home/main/tvshows_card.dart';
import 'package:netflix/presentation/home/main/upcoming_card.dart';
import 'package:netflix/presentation/home/number_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<TrendingBloc>(context).add(const GetUpComingImage());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }

            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  BlocBuilder<TrendingBloc, TrendingState>(
                    builder: (context, state) {
                      // final movie = state.upcoming?[1];
                      // print(movie);
                      if (state.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state.upcoming!.isEmpty) {
                        return const Center(
                          child: Text('list is empty'),
                        );
                      } else {
                        return Background_card(
                          image:
                              '$imageAppendurl${state.upcoming![0].posterPath}',
                        );
                      }
                    },
                  ),
                  const TrendingCard(Title: 'Trending'),
                  const PopularCard(Title: 'Popular'),
                  const UpComingCard(Title: 'Up Coming'),
                  const NumberTitleCard(),
                  const TvShowsCard(Title: 'Tv Shows'),
                ],
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        color: Colors.black.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.network(
                                    width: 70,
                                    height: 50,
                                    'https://static.vecteezy.com/system/resources/previews/019/956/195/non_2x/netflix-transparent-netflix-free-free-png.png'),
                                const Spacer(),
                                const Icon(Icons.cast),
                                kwidth,
                                Container(
                                  color: Colors.blue,
                                  width: 30,
                                  height: 30,
                                ),
                                kwidth
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Tv Shows', style: ktextstyle),
                                Text('Movies', style: ktextstyle),
                                Text('categories', style: ktextstyle),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : kHeight
            ],
          ),
        );
      },
    ));
  }
}
