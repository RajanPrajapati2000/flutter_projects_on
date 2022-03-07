// apiPath, searchText, List<Movie>movies, int page

import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';

class MovieState {
  late String apiPath;
  late String searchText;
  late List<Movie> movies;
  late int page;

  MovieState(
      {required this.searchText,
      required this.page,
      required this.apiPath,
      required this.movies});

  MovieState.initState()
      : movies = [],
        apiPath = Api.getPopularMovie,
        page = 1,
        searchText = '';

  MovieState copyWith(
      {String? apiPath, String? searchText, int? page, List<Movie>? movies}) {
    return MovieState(
        searchText: searchText ?? this.searchText,
        page: page ?? this.page,
        apiPath: apiPath ?? this.apiPath,
        movies: movies ?? this.movies);
  }
}
