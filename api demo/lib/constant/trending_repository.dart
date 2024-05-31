import 'dart:developer';

import 'package:apidemo/constant/api_key.dart';
import 'package:apidemo/domain/failure/Main_failure.dart';
import 'package:apidemo/domain/i_trending_repo.dart';
import 'package:apidemo/domain/trending/trending.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ITrendingRepo)
class TrendingRepository implements ITrendingRepo {
  @override
  Future<Either<MainFailure, List<Trending>>> getTrendingImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.trending);

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
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<Trending>>> getPopularImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.popular);

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
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
