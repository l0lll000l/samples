import 'package:dartz/dartz.dart';
import 'package:netflix/domain/downloads/main_failure.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

abstract class IdownloadsRepo {
  Future<Either<Mainfailure, List<Downloads>>> getDownloadsImages();
}
