import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/api_endpoints.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/newandhot/model/newandhot_respo.dart';
import 'package:netflix/domain/newandhot/new_and_hot_service.dart';

@LazySingleton(as: HotAndNewService)
class NewAndHotImplimentation implements HotAndNewService {
  @override
  Future<Either<Mainfailure, NewandhotResp>> getHotandNewMovieData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoint.hotAndNewMovie);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //**********************************log********* */
        // log(response.data.toString());
        final result = NewandhotResp.fromJson(response.data);
        // log(response.data.toString());
        // print(response.data);

        return right(result);
      } else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      //****************************************log********** */
      log(e.toString());
      return const Left(Mainfailure.clientfailure());
    }
  }

//********************************************************************************************* */
  @override
  Future<Either<Mainfailure, NewandhotResp>> getHotandNewtvData() async {
    try {
      final response = await Dio(BaseOptions()).get(ApiEndPoint.hotAndNewTv);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //**********************************log*************** */
        // log(response.data.toString());
        final result = NewandhotResp.fromJson(response.data);
        // log(response.data.toString());
        // print(response.data);

        return right(result);
      } else {
        return const Left(Mainfailure.serverfailure());
      }
    } catch (e) {
      //****************************************log*********** */
      log(e.toString());
      return const Left(Mainfailure.clientfailure());
    }
  }
}
