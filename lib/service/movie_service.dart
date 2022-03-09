import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MovieService{


  //get_movies

  static Future<List<Movie>> getMovies(String apiPath, int page) async{
    final prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'page': page
      });
      if(apiPath == Api.getPopularMovie){
        prefs.setString('movie', jsonEncode(response.data['results']));
      }
      final  data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      return data;
    }on DioError catch (err){
      if(err.type == DioErrorType.other){
        if(apiPath == Api.getPopularMovie){
           final decodedData = jsonDecode(prefs.getString('movie')!);
          final  data = (decodedData as List).map((e) => Movie.fromJson(e)).toList();
          return data;
        }
        throw err;
      }
      throw err;
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