import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Movie(
      {required this.title,
      required this.genre,
      required this.releaseDate,
      required this.imageUrl});
}


final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

class Counter extends StateNotifier<int>{
  Counter() : super(0);

  void increment(){
    state = state + 1;
  }


}