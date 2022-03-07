import 'package:dio/dio.dart';
import 'package:flutter_project/models/movie.dart';



class MovieService{


  //get_movies

  static Future<List<Movie>> getMovies(String apiPath, int page) async{
    final dio = Dio();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'page':1
      });

      final  data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return data;
    }on DioError catch (err){

      throw err;

    }


  }



//search_movies

  static Future<List<Movie>> searchMovies(String apiPath, int page, String query) async{
    final dio = Dio();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'page':1,
        'query': query
      });

      final  data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      if(data.isEmpty){
         return [Movie.initState()];
      }else{
        return data;
      }


    }on DioError catch (err){
      print(err);
      throw err;

    }


  }




}