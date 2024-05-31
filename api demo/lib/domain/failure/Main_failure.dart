import 'package:freezed_annotation/freezed_annotation.dart';
part 'Main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.clientFailure() = _clientFailure;
  const factory MainFailure.serverFailure() = _serverFailure;
}
