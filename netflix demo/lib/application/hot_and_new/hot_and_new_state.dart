part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState(
      {required final List<NewandHotData> comingSoonList,
      required bool isLoading,
      required bool isError,
      required final List<NewandHotData> everyoneIsWatchingList}) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
      comingSoonList: [],
      everyoneIsWatchingList: [],
      isLoading: false,
      isError: false);
}
