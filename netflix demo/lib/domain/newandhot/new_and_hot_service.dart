import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/newandhot/model/newandhot_respo.dart';

abstract class HotAndNewService {
  Future<Either<Mainfailure, NewandhotResp>> getHotandNewMovieData();
  Future<Either<Mainfailure, NewandhotResp>> getHotandNewtvData();
}
