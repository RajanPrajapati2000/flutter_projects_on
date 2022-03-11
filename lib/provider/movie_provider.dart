import 'package:flutter_project/api.dart';
import 'package:flutter_project/models/movie.dart';
import 'package:flutter_project/models/movie_state.dart';
import 'package:flutter_project/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final stateMovieProvider = StateNotifierProvider.family<MoviesProvider, MovieState, String>((ref, api) => MoviesProvider(apiPath: api));

class MoviesProvider extends StateNotifier<MovieState> {
  MoviesProvider({required this.apiPath}) : super(MovieState.initState()){
     getMovies();
  }

 final String apiPath;

  Future<void> getMovies() async{
    List<Movie> _movies = [];
    if(state.searchText == ''){
      if(apiPath == Api.getPopularMovie){
        _movies = await MovieService.getMovies(apiPath, state.page);
      }else if(apiPath == Api.getTopRatedMovie){
        _movies = await MovieService.getMovies(apiPath, state.page);
      }else{
        _movies = await MovieService.getMovies(apiPath, state.page);
      }
     }else{
      _movies = await MovieService.searchMovies(state.apiPath, state.page, state.searchText);
    }

  state = state.copyWith(
    movies: [...state.movies, ..._movies],
  );

  }



//search_movies


  void searchMovie(String query){
   state = state.copyWith(
     movies: [],
     apiPath: Api.getSearchMovie,
     searchText: query
   );
   getMovies();
  }




//load_more
void loadMore(){
    state = state.copyWith(
      searchText: '',
       page:  state.page + 1
    );
    getMovies();
}


}
