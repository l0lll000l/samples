import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/downloads/core/injectable.dart';
import 'package:netflix/domain/newandhot/model/newandhot_respo.dart';
import 'package:netflix/presentation/new_and_hot/coming_soon.dart';
import 'package:netflix/presentation/new_and_hot/everyones_watching.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    //
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataComingSoon());
      BlocProvider.of<HotAndNewBloc>(context).add(const EveryOneIsWatching());
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                title: const Text(
                  'New & hot',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                actions: [
                  const Icon(Icons.cast),
                  kwidth,
                  Container(
                    color: Colors.blue,
                    width: 30,
                    height: 30,
                  ),
                  kwidth
                ],
                bottom: const TabBar(
                    unselectedLabelColor: kwhite,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle: TextStyle(
                      fontSize: 16,
                    ),
                    indicator: BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    tabs: [
                      Tab(text: '   🍿 Coming soon'),
                      Tab(text: '👀 Everyones watching'),
                    ]),
              )),
          body: const TabBarView(children: [
            ComingSoonList(
              key: Key('coming_soon'),
            ),
            EveryoneisWatchingList(),
          ])),
    );
  }
}
//*************************** coming soon *********************************************** */

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        } else if (state.isError) {
          return const Center(
              child: Text('Error while loading coming soon list'));
        } else if (state.comingSoonList.isEmpty) {
          return const Center(child: Text('coming soon list is empty'));
        } else {
          return ListView.builder(
            itemCount: state.comingSoonList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }
              //---------------------------------------------------------
              final _date = DateTime.parse(movie.releaseDate!);

              final formatedDate = DateFormat.yMMMMd('en_US').format(_date);

              List splitedDate = formatedDate.split('').sublist(0, 3);
              String finalDate = splitedDate.join('');

              //---------------------------------------------------------
              return ComingSoonWidget(
                id: movie.id.toString(),
                month: finalDate,
                day: movie.releaseDate!.split('').sublist(5, 7).join(''),
                posterPath: '$imageAppendurl${movie.posterPath}',
                movieName: movie.originalTitle ?? 'no title',
                description: movie.overview ?? 'no description',
              );
            },
          );
        }
      },
    );
  }
}

//******************************* EveryoneIsWatching ******************************************* */
class EveryoneisWatchingList extends StatelessWidget {
  const EveryoneisWatchingList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        } else if (state.isError) {
          return const Center(
              child: Text('Error while loading coming soon list'));
        } else if (state.everyoneIsWatchingList.isEmpty) {
          return const Center(
              child: Text('everyone is watching  list is empty'));
        } else {
          return ListView.builder(
            itemCount: state.everyoneIsWatchingList.length,
            itemBuilder: (BuildContext context, index) {
              final movie = state.everyoneIsWatchingList[index];
              //-------------------------------------
          

              return EveryOnesWatching(
                posterPath: '$imageAppendurl${movie.posterPath}',
                movieName: movie.originalTitle1 ?? 'no ',
                description: movie.overview ?? 'no description',
              );
            },
          );
        }
      },
    );
  }
}
