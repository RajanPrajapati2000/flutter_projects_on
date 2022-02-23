import 'package:flutter/material.dart';
import 'package:flutter_project/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
            builder: (context, ref, child) {
              final news = ref.watch(newsProvider);
              return news.when(
                  data: (data){
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder:(context, index){
                          return Text(data[index].summary);
                        }
                    );
                  },
                  error: (err, stack) => Center(child: Text('$err'),),
                  loading: () => Center(child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),)
              );
            }
        )
    );
  }
}
