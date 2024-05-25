import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_failure.freezed.dart';

@freezed
class Mainfailure with _$Mainfailure {
  const factory Mainfailure.clientfailure() = _clientfailure;
  const factory Mainfailure.serverfailure() = _serverfailure;
}
