import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/domain/search/model/search_response/search_respo.dart';
import 'package:netflix/domain/search/model/search_service.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IdownloadsRepo _downloadsService;
  final SearchService _searchService;
  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    //*******************************************************idle******************************************************** */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(SearchState(
          searchResultList: [],
          idleList: state.idleList,
          isLoading: true,
          isError: false,
        ));
        return;
      }
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: false,
        isError: true,
      ));

      final _result = await _downloadsService.getDownloadsImages();
      final _state = _result.fold(
        (Mainfailure f) {
          return const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idleList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
    //*******************************************************search result******************************************************** */
    on<SearchMovie>((event, emit) async {
      // log('searching for ${event.movieQuery}');
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: true,
      ));
      //call movie api
      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (Mainfailure f) {
          const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResponse r) {
          return SearchState(
            searchResultList: r.results,
            idleList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state!);
    });
  }
}
