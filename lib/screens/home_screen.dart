import 'package:flutter/cupertino.dart';
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
                        itemBuilder: (context, index){
                          return Card(
                              child: Container(
                                padding: EdgeInsets.all(7),
                                margin: EdgeInsets.only(bottom: 17),
                                width: double.infinity,
                                height: 250,
                                child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data[index].title,maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w500),),
                                    SizedBox(height: 15,),
                                    Text(data[index].summary, maxLines: 6, textAlign: TextAlign.justify,),
                                    SizedBox(height: 15,),
                                  if(data[index].author !='')  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,

                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Text(data[index].author)),
                                    SizedBox(height: 15,),
                                    Text(data[index].published_date),
                                  ],
                                ),
                              ),
                                SizedBox(width: 11,),
                                Container(
                                    width: 160,
                                    height: 250,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(data[index].media, fit: BoxFit.cover,))),
                            ],
                          ),
                              ));
                        }
                    );
                  },
                  error: (err, stack) => Text('$err'),
                loading: () => Center(child: CircularProgressIndicator(
                  color: Colors.purple,
                ),),
              );
            }
    )
    );
  }
}
