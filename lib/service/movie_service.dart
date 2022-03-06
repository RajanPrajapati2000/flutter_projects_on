



import 'package:dio/dio.dart';
import 'package:flutter_project/models/movie.dart';

class MovieService{

  //get_movies

 static Future<List<Movie>> getMovies(String apiPath, int page) async{
    final dio = Dio();
    try{

      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'page': page
      });
      final   movies = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
       return movies;
    }on DioError catch (err){
      print(err);
      return [];
    }

  }


//search_movies

  static Future<List<Movie>> searchMovies(String apiPath, int page, String query) async{
    final dio = Dio();
    try{

      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'page': page,
        'query': query
      });
      final   movies = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return movies;
    }on DioError catch (err){
      print(err);
      return [];
    }

  }


}