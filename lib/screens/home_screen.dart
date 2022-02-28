import 'package:flutter/material.dart';
import 'package:flutter_project/provider/movie_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        flexibleSpace: Image.asset('assets/images/movie.png', fit: BoxFit.cover,),
      ),
        body: Consumer(
            builder: (context, ref, child){
              final movies = ref.watch(movieProvider);
             return movies.isEmpty ? Center(child: CircularProgressIndicator(
               color: Colors.purple,
             ),) : Padding(
               padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
               child: GridView.builder(
                 itemCount: movies.length,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 3,
                     crossAxisSpacing: 5,
                     mainAxisSpacing: 5,
                     childAspectRatio: 2/3
                   ),
                   itemBuilder: (context, index){
                   final movie = movies[index];
                   return ClipRRect(
                       borderRadius: BorderRadius.circular(10),
                       child: Image.network('https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie.poster_path}'));
                   }
               ),
             );
            }
    )
    );
  }
}
