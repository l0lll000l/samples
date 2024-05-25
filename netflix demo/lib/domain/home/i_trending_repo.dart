import 'package:dartz/dartz.dart';
import 'package:netflix/domain/home/trending.dart';
import 'package:netflix/domain/downloads/main_failure.dart';

abstract class ITrendingRepo {
  Future<Either<Mainfailure, List<Trending>>> getTrendingImages();
  Future<Either<Mainfailure, List<Trending>>> getPopularImages();
  Future<Either<Mainfailure, List<Trending>>> getUpComingImages();
  Future<Either<Mainfailure, List<Trending>>> getTvShowsImages();
}
