import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/api_endpoints.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/home/i_trending_repo.dart';
import 'package:netflix/domain/home/trending.dart';

@LazySingleton(as: ITrendingRepo)
class TrendingRepository implements ITrendingRepo {
  @override
  Future<Either<Mainfailure, List<Trending>>> getTrendingImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.trending);

      //-----------------------------------------------------------
      if (response.statusCode == 200 || response.statusCode == 201) {
        final trendingList = (response.data['results'] as List).map((e) {
          return Trending.fromJson(e);
        }).toList();
        // log(trendingList.toString());
        return right(trendingList);
      }
      //-------------------------------------------------------------------
      else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      return const Left(Mainfailure.clientfailure());
    }
  }

  @override
  Future<Either<Mainfailure, List<Trending>>> getPopularImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.popular);

      //-----------------------------------------------------------
      if (response.statusCode == 200 || response.statusCode == 201) {
        final popularList = (response.data['results'] as List).map((e) {
          return Trending.fromJson(e);
        }).toList();
        // log(trendingList.toString());
        return right(popularList);
      }
      //-------------------------------------------------------------------
      else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      return const Left(Mainfailure.clientfailure());
    }
  }

  @override
  Future<Either<Mainfailure, List<Trending>>> getTvShowsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.tvShows);

      //-----------------------------------------------------------
      if (response.statusCode == 200 || response.statusCode == 201) {
        final tvShowsList = (response.data['results'] as List).map((e) {
          return Trending.fromJson(e);
        }).toList();
        // log(trendingList.toString());
        return right(tvShowsList);
      }
      //-------------------------------------------------------------------
      else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      return const Left(Mainfailure.clientfailure());
    }
  }

  @override
  Future<Either<Mainfailure, List<Trending>>> getUpComingImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.upcoming);

      //-----------------------------------------------------------
      if (response.statusCode == 200 || response.statusCode == 201) {
        final upComingList = (response.data['results'] as List).map((e) {
          return Trending.fromJson(e);
        }).toList();
        // log(trendingList.toString());
        return right(upComingList);
      }
      //-------------------------------------------------------------------
      else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      return const Left(Mainfailure.clientfailure());
    }
  }
}
