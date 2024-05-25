import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/i_downloads.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IdownloadsRepo _downloadsrepo;
  DownloadsBloc(this._downloadsrepo) : super(DownloadsState.initial()) {
    on<_getDownloadsImages>((event, emit) async {
      //
      emit(state.copyWith(
          isloading: true, downloadsfailureorscuccessoption: none()));

      //
      final Either<Mainfailure, List<Downloads>> downloadsoption =
          await _downloadsrepo.getDownloadsImages();

      // log(downloadsoption.toString());

      //

      emit(downloadsoption.fold(
          (failure) => state.copyWith(
              isloading: false,
              downloadsfailureorscuccessoption: some(Left(failure))),
          (success) => state.copyWith(
              isloading: false,
              downloads: success,
              downloadsfailureorscuccessoption: some(right(success)))));
    });
  }
}
