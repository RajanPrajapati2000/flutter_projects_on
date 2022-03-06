


// apiPath, searchText, List<Movie>movies, int page


import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';

class MovieState{

 late String apiPath;
 late String searchText;
 late List<Movie> movies;
 late int page;


 MovieState({required this.apiPath,required this.movies,
  required this.page, required this.searchText});


 MovieState.initState(): searchText='', page=1, movies=[], apiPath=Api.getPopularMovie ;


   MovieState copyWith({String ? apiPath, String? searchText, int? page, List<Movie>? movies}){
    return MovieState(
        apiPath: apiPath ?? this.apiPath,
        movies: movies ?? this.movies,
        page: page ?? this.page,
        searchText: searchText ?? this.searchText
    );
   }




 }