import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/provider/movie_provider.dart';
import 'package:flutter_project/screens/detail_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';




class PopularPage extends StatelessWidget {
  final String page;
  PopularPage(this.page);


  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        builder: (context) => Container(),
    connectivityBuilder: (BuildContext context,ConnectivityResult connectivity,Widget child,) {
      return Consumer(
        builder: (context, ref, child) {
          final stateMovie = ref.watch(stateMovieProvider(Api.getPopularMovie));
          return stateMovie.movies.isEmpty ? Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
            ),) : stateMovie.movies[0].title == 'not available'
              ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('please use correct  keyword to search movies'),
                Container(
                  width: 250,
                  child: ElevatedButton(onPressed: () {
                    ref.refresh(stateMovieProvider(''));
                  }, child: Text('refresh')),
                )
              ],
            ),
          )
              : Padding(
            padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
            child: NotificationListener(
              onNotification: (onNotification) {
                if (onNotification is ScrollEndNotification) {
                  final before = onNotification.metrics.extentBefore;
                  final max = onNotification.metrics.maxScrollExtent;
                  if (before == max) {
                    if(connectivity != ConnectivityResult.none)
                    ref.read(stateMovieProvider(Api.getPopularMovie).notifier).loadMore();
                  }
                }
                return true;
              },
              child: GridView.builder(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  key: PageStorageKey(page),
                  itemCount: stateMovie.movies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 2 / 3
                  ),
                  itemBuilder: (context, index) {
                    final movie = stateMovie.movies[index];
                    return InkWell(
                      onTap: (){
                        Get.to(() => DetailScreen(movie), transition: Transition.leftToRight);
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: movie.poster_path == ''
                              ? Image.asset('assets/images/no-image.jpg')
                              : CachedNetworkImage(
                              imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie
                                  .poster_path}')),
                    );
                  }
              ),
            ),
          );
        },
        child: Container(),
      );
    }
    );
        }
  }

