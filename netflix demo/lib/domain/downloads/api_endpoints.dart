import 'package:netflix/core/constants.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoint {
  static const downloads = '$kbaseUrl/trending/all/day?api_key=$apiKey';
  static const search = '$kbaseUrl/search/movie?api_key=$apiKey';
  static const hotAndNewMovie = '$kbaseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$kbaseUrl/discover/tv?api_key=$apiKey';
  static const trending = '$kbaseUrl/movie/now_playing?api_key=$apiKey';
  static const popular = '$kbaseUrl/movie/top_rated?api_key=$apiKey';
  static const upcoming = '$kbaseUrl/movie/upcoming?api_key=$apiKey';
  static const tvShows = '$kbaseUrl/tv/airing_today?api_key=$apiKey';
}
