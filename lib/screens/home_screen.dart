import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/api.dart';
import 'package:flutter_project/provider/movie_provider.dart';
import 'package:flutter_project/widgets/popular_page.dart';
import 'package:flutter_project/widgets/tab_bar_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 165,
          flexibleSpace: Image.asset('assets/images/movie.png', fit: BoxFit.cover,),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50),
            child: Consumer(
              builder: (context, ref, child) {
                return TabBar(

                  onTap: (index){
                   ref.read(stateMovieProvider.notifier).updateCategory(index);
                  },
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
                );
              }
            ),
          ),
        ),
          body: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
                    child: TextFormField(
                      controller: searchController,
                      onFieldSubmitted: (val) {
                        searchController.clear();
                        ref.read(stateMovieProvider.notifier).searchMovie(val);
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: 'search for movies',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)
                          )
                      ),
                    ),
                  );
                }
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                    children: [
                   PopularPage(),
                   TabBarWidget(),
                   TabBarWidget(),
                    ]
                ),
              ),
            ],
          )
      ),
    );
  }
}
