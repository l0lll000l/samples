import 'dart:developer';

import 'package:apidemo/applications/bloc/trending_bloc.dart';
import 'package:apidemo/constant/constant.dart';
import 'package:apidemo/home/Background_card.dart';
import 'package:apidemo/home/main_card.dart';
import 'package:apidemo/home/main_title_card.dart';
import 'package:apidemo/home/maincard/popular_card.dart';
import 'package:apidemo/home/maincard/trending_card.dart';
import 'package:apidemo/home/number_title_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<TrendingBloc>(context).add(const GetTrendingImage());
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
                children: const [
                  Background_card(),
                  PopularCard(title: 'popular'),

                  TrendingCard(title: 'trending'),
                  MainTitleCard(title: 'south indian drama', image3: imageurl1),
                  //----------------------------------------------
                  MainTitleCard(title: 'Trending Now'),
                  NumberTitleCard(),
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
