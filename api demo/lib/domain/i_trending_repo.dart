import 'package:apidemo/domain/failure/Main_failure.dart';
import 'package:apidemo/domain/trending/trending.dart';
import 'package:dartz/dartz.dart';

abstract class ITrendingRepo {
  Future<Either<MainFailure, List<Trending>>> getTrendingImages();
  Future<Either<MainFailure, List<Trending>>> getPopularImages();
}
