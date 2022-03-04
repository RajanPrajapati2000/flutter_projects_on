import 'package:dio/dio.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieProvider = StateNotifierProvider.family<MovieProvider, List<Movie>, String>((ref, path) => MovieProvider(apiPath: path));


class MovieProvider extends StateNotifier<List<Movie>>{
  MovieProvider({required this.apiPath}) : super([]){
    getMovies();
  }

  final String apiPath;

  Future<void> getMovies() async{
  final dio = Dio();
    try{

    final response = await dio.get(apiPath, queryParameters: {
      'api_key': '2a0f926961d00c667e191a21c14461f8',
      'language': 'en-Us'
    });

    state = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();

    }on DioError catch (e){

      print(e);

    }

  }

  Future<void> searchMovies(String query) async{
    final dio = Dio();
    try{

      final response = await dio.get('https://api.themoviedb.org/3/search/movie', queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'language': 'en-Us',
        'query': query
      });

     // state = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
      print(response.data);
    }on DioError catch (e){

      print(e);

    }

  }




}