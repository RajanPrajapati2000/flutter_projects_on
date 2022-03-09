import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
final moviesProvider = ChangeNotifierProvider((ref) => Movies());

class Movies extends ChangeNotifier {

  List<Movie> movies = [
    Movie(
        title: 'Spider man',
        genre: ['action', 'crime', 'fantasy'],
        releaseDate: 2022,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png'
    ),
    Movie(
        title: 'Perfume',
        genre: ['action', 'crime', 'history'],
        releaseDate: 2005,
        imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTg2Mzk2NjkzNl5BMl5BanBnXkFtZTYwMzIzOTc2._V1_.jpg'
    ),
  ];
  void addMovie(Movie movie) {
    movies.add(movie);
    notifyListeners();
  }
}


class Movie {
  late String title;
  late List<String> genre;
  late int releaseDate;
  late String imageUrl;


  Movie.initState(): genre=[], imageUrl='https://m.media-amazon.com/images/M/MV5BMTg2Mzk2NjkzNl5BMl5BanBnXkFtZTYwMzIzOTc2._V1_.jpg', releaseDate=2022, title='Perfume';

  Movie(
      {required this.title,
      required this.genre,
      required this.releaseDate,
      required this.imageUrl});

  Movie copyWith({ String? title, List<String>? genre, int? releaseDate, String? imageUrl }){
     return Movie(
         title: title ?? this.title,
         genre: genre ?? this.genre,
         releaseDate: releaseDate ?? this.releaseDate,
         imageUrl: imageUrl ?? this.imageUrl
     );
  }
}


final counterProvider = StateNotifierProvider<Counter, Movie>((ref) => Counter());

class Counter extends StateNotifier<Movie>{
  Counter() : super(Movie.initState());

  void update(){
    state = state.copyWith(
      releaseDate: Random().nextInt(3000),
    );
  }


}


// class M {
//   late int number;
//   M({required this.number});
// }
//
// class B extends M{
//   B({required int number}) : super(number: number);
//
// }