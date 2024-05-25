import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/api_endpoints.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/search/model/search_response/search_respo.dart';
import 'package:netflix/domain/search/model/search_service.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<Mainfailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response =
          await Dio(BaseOptions()).get(ApiEndPoint.search, queryParameters: {
        'query': movieQuery,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        //**********************************log************************************* */
        // log(response.data.toString());
        final result = SearchResponse.fromJson(response.data);
        // log(response.data.toString());
        // print(response.data);

        return right(result);
      } else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      //****************************************log********************************************* */
      // log(e.toString());
      return const Left(Mainfailure.clientfailure());
    }
  }
}
