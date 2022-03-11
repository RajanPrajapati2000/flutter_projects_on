import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_project/models/movie.dart';
import 'package:flutter_project/provider/video_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



class DetailScreen extends StatelessWidget {
  final Movie movie;
  DetailScreen(this.movie);
  @override
  Widget build(BuildContext context) {
    print(movie.id);
    final videoProvider = FutureProvider((ref) => VideoProvider().getMovieKey(movie.id));

    return Scaffold(
        body: SafeArea(
          child: OfflineBuilder(
            builder: (context) => Text(''),
    connectivityBuilder: (BuildContext context,ConnectivityResult connectivity,Widget child,) {
      if(connectivity == ConnectivityResult.none){
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off_outlined, size: 150, color: Colors.pink.withOpacity(0.9),),
              Text('no connection try again', style: TextStyle(fontSize: 19, color: Colors.blueGrey),),
            ],
          ),
        );
      }
      return Consumer(
          builder: (context, ref, child) {
            final videoData = ref.watch(videoProvider);
            return ListView(
              children: [
                videoData.when(
                    data: (data) {
                      return YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: data,
                          flags: YoutubePlayerFlags(
                            autoPlay: false,
                          ),
                        ),
                        showVideoProgressIndicator: true,
                      );
                    },
                    error: (err, stack) => Text('$err'),
                    loading: () =>
                        Container(
                          height: 236,
                        )
                ),
                SizedBox(height: 15,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  height: 350,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie
                          .poster_path}', fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Expanded(
                              child: Text(
                                movie.title, style: TextStyle(fontSize: 20),
                                maxLines: 2,
                              )),
                          Text(movie.release_date,
                            style: TextStyle(fontWeight: FontWeight.w500),),

                        ],
                      ),
                      SizedBox(height: 15,),
                      Text(movie.overview, textAlign: TextAlign.justify,
                        style: TextStyle(letterSpacing: 1, fontFamily: 'Josefin', fontSize: 17),),
                    ],
                  ),
                )

              ],
            );
          }
      );
    }
          ),
        )
    );
  }
}
