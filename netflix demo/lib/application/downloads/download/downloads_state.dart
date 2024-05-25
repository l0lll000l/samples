part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isloading,
    required List<Downloads>? downloads,
    required Option<Either<Mainfailure, List<Downloads>>>
        downloadsfailureorscuccessoption,
  }) = _DownloadsState;
  factory DownloadsState.initial() {
    return const DownloadsState(
        isloading: false,
        downloadsfailureorscuccessoption: None(),
        downloads: []);
  }
}
