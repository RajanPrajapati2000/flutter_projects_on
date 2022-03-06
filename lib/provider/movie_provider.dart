import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';
import 'package:flutter_project/models/movie_state.dart';
import 'package:flutter_project/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stateMovieProvider = StateNotifierProvider<MoviesProvider, MovieState>((ref) => MoviesProvider());

class MoviesProvider extends StateNotifier<MovieState> {
  MoviesProvider() : super(MovieState.initState()){
    getMovies();
  }


  List<Movie> _movies = [];

  Future<void> getMovies() async {
   if(state.searchText == ''){
      if(state.apiPath == Api.getPopularMovie){
           _movies = await MovieService.getMovies(state.apiPath, state.page);
      }else if(state.apiPath == Api.getTopRatedMovie){
        _movies = await MovieService.getMovies(state.apiPath, state.page);
      }else{
        _movies = await MovieService.getMovies(state.apiPath, state.page);
      }


   }else{


  _movies = await  MovieService.searchMovies(state.apiPath, state.page, state.searchText);
   }

     state = state.copyWith(
       movies:  [...state.movies, ..._movies]
     );


    }



//update_category

  void updateCategory(int index){

    switch(index){
      case 0:
        state = state.copyWith(
          movies: [],
          apiPath: Api.getPopularMovie,
          searchText: ''
        );
        getMovies();
        break;
      case 1:
        state = state.copyWith(
          movies: [],
          apiPath: Api.getTopRatedMovie,
          searchText: ''
        );
           getMovies();
        break;
      default:
        state = state.copyWith(
          movies: [],
          apiPath: Api.getUpcomingMovie,
          searchText: ''
        );
        getMovies();
    }

  }


//search_movies


  void searchMovies(String searchText){
  state  = state.copyWith(
    searchText: searchText,
    apiPath: Api.getSearchMovie,
    movies: []
  );

  getMovies();

  }


//load_more




}
