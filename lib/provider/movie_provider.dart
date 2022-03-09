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

  Future<void> getMovies() async{

    List<Movie> _movies = [];

    if(state.searchText == ''){
      if(state.apiPath == Api.getPopularMovie){
        _movies = await MovieService.getMovies(state.apiPath, state.page);
      }else if( state.apiPath == Api.getTopRatedMovie){
        _movies = await MovieService.getMovies(state.apiPath, state.page);
      }else{
        _movies = await MovieService.getMovies(state.apiPath, state.page);
      }
     }else{

      _movies = await MovieService.searchMovies(state.apiPath, state.page, state.searchText);
    }

  state = state.copyWith(
    movies: [...state.movies, ..._movies],
  );

  }


//update_category

void updateCategory(int index){
   if(index == 0){
     state  = state.copyWith(
       movies: [],
       searchText: '',
       apiPath: Api.getPopularMovie
     );
     getMovies();
   }else if( index == 1){
     state  = state.copyWith(
         movies: [],
         searchText: '',
         apiPath: Api.getTopRatedMovie
     );
     getMovies();
   }else{
     state  = state.copyWith(
         movies: [],
         searchText: '',
         apiPath: Api.getUpcomingMovie
     );
     getMovies();
   }
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
