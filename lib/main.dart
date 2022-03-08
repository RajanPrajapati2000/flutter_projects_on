import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project/sample/sample_provider.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



void main ()async{

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.black
    )
  );

runApp(ProviderScope(child: Home()));
}




class Home extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
        body: Consumer(
          builder: (context, ref, child) {
            final data = ref.watch(moviesProvider);
            final counts = ref.watch(counterProvider);
            return Container(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: data.movies.map((e) {
                      return Container(
                          height: 300,
                          width: 300,
                          child: Column(
                            children: [
                              Image.network(e.imageUrl, fit: BoxFit.cover, height: 200, width: 200,),
                              Row(
                                children: e.genre.map((e){
                                  return Text(e);
                                }).toList(),
                              )
                            ],
                          ));
                    }).toList()
                  ),
                  TextButton(onPressed: (){
                    ref.read(counterProvider.notifier).increment();
                    // ref.read(moviesProvider).addMovie(
                    //     Movie(
                    //     title: 'God',
                    //     genre: [''],
                    //     releaseDate: 2021,
                    //     imageUrl: 'https://upload.wikimedia.org/wikipedia/en/2/21/Web_of_Spider-Man_Vol_1_129-1.png'
                    // ));
                  }, child: Text('add movie $counts', style: TextStyle(fontSize: 25),))
                ],
              ),
            );
          }
        )
    );
  }
}


