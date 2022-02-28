import 'package:dio/dio.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieProvider = StateNotifierProvider<MovieProvider, List<Movie>>((ref) => MovieProvider());

class MovieProvider extends StateNotifier<List<Movie>>{
  MovieProvider() : super([]){
    getPopularMovies();
  }


  Future<void> getPopularMovies() async{
    final dio  = Dio();

    try{
        final response = await dio.get(Api.getPopular, queryParameters: {
          'api_key': '2a0f926961d00c667e191a21c14461f8',
          'language': 'en-Us'
        });
     state = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
    }on DioError catch (err){

      print(err);

    }

  }


}