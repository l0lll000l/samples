import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/domain/downloads/api_endpoints.dart';
import 'package:netflix/domain/downloads/i_downloads.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

@LazySingleton(as: IdownloadsRepo)
class Downloadsrepository implements IdownloadsRepo {
  @override
  Future<Either<Mainfailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoint.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        //**********************************log************************************* */
        // log(response.data.toString());
        final downloadsList = (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        // print(downloadsList);
        return right(downloadsList);
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
