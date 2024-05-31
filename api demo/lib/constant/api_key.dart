const apiKey = '173fe9a9cf19bcbf89e07d0e8a31733a';
const kbaseUrl = 'https://api.themoviedb.org/3';

class ApiEndPoints {
  static const trending = '$kbaseUrl/movie/now_playing?api_key=$apiKey';
  static const popular = '$kbaseUrl/movie/top_rated?api_key=$apiKey';
}
