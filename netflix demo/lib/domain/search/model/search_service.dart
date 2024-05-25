import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/search/model/search_response/search_respo.dart';

abstract class SearchService {
  Future<Either<Mainfailure, SearchResponse>> searchMovies(
      {required String movieQuery});
}
