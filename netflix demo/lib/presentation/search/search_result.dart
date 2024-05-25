import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/search/title.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //******************************************************************************* */
        const SearchWidgetTitle(title: 'Movies and Tv'),
        //                                                             title
        //******************************************************************************* */
        kHeight,
        Expanded(
            //                                                      grid view
            child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return GridView.count(
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.4,
              children: List.generate(19, (index) {
                final movie = state.searchResultList[index];
                return MainCard(
                  imageurl: movie.posterImageUrl,
                );
                //******************************************************************************* */
              }),
            );
          },
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageurl;
  const MainCard({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(imageurl))),
    );
  }
}
