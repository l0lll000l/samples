import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';

import 'package:netflix/presentation/search/search_idle.dart';
import 'package:netflix/presentation/search/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //*******************************search text field************************************************ */
            CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons
                      .xmark_circle_fill, //                 search logo
                  color: Colors.grey,
                ),
                style: const TextStyle(color: kwhite),
                onChanged: (value) {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                }),

            //******************************************************************************* */
            kHeight,
            //******************************************************************************* */
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdleWidget();
                } else {
                  return const Expanded(child: SearchResult());
                }
              },
            ))
          ],
        ),
      )),
    );
  }
}

//part 47
//49.35
