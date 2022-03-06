import 'package:flutter/material.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/provider/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class TabBarWidget extends StatelessWidget {

  final String apiPath = '';



  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ref, child){
          final stateMovie = ref.watch(stateMovieProvider);
          return stateMovie.movies.isEmpty ? Center(child: CircularProgressIndicator(
            color: Colors.purple,
          ),) : Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: GridView.builder(
                itemCount: stateMovie.movies.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 2/3
                ),
                itemBuilder: (context, index){
                  final movie = stateMovie.movies[index];
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network('https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie.poster_path}'));
                }
            ),
          );
        }
    );
  }
}
