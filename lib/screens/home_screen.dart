import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/widgets/tab_bar_widgets.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,

          toolbarHeight: 170,
          flexibleSpace: Image.asset('assets/images/movie.png', fit: BoxFit.cover,),
          bottom: TabBar(
            indicatorColor: Colors.purpleAccent,
              tabs: [
                Tab(
                  icon: Icon(Icons.cast, size: 30,),
                  text: 'Popular Movies',
                ),
                Tab(
                  icon: Icon(CupertinoIcons.ant_circle, size: 30),
                  text: 'Top_Rated Movies',
                ),
                Tab(
                  icon: Icon(Icons.wysiwyg, size: 30,),
                  text: 'UpComing Movies',
                ),
              ]
          ),
        ),
          body: TabBarView(
              children: [
             TabBarWidget(Api.getPopularMovie),
             TabBarWidget(Api.getTopRatedMovie),
             TabBarWidget(Api.getUpcomingMovie),
              ]
          )
      ),
    );
  }
}
