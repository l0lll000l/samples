import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IdownloadsRepo _downloadservice,
  ) : super(FastLaughState.initial()) {
    //sending loading to ui
    on<Initialize>((event, emit) async {
      emit(const FastLaughState(
        videosList: [],
        isLoading: true,
        isError: false,
      ));
      //get  trending movies
      final _result = await _downloadservice.getDownloadsImages();
      final _state = _result.fold((l) {
        return const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        );
      },
          (resp) => FastLaughState(
                videosList: resp,
                isLoading: false,
                isError: false,
              ));

      emit(_state);
    });
//************************liked video*************** */
    on<LikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
    //************************unliked video*************** */
    on<UnLikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();
    });
  }
}
