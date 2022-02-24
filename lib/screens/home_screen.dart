import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Consumer(
            builder: (context, ref, child){
              final news = ref.watch(newsProvider);
              return news.when(
                  data: (data){
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index){
                          final dat = data[index];
                          return Card(
                            child: Container(
                              padding: EdgeInsets.all(7),
                              height: 195,
                              width: double.infinity,
                              child: Row(
                                children: [

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(dat.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.w500),),
                                       SizedBox(height: 7,),
                                        Text(dat.summary, maxLines: 5, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.blueGrey),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 5),
                                          child: Text(dat.author,  overflow: TextOverflow.ellipsis,),
                                        ),
                                        Text(dat.published_date,  overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                  ),


                                  SizedBox(width: 10,),
                             dat.media == '' ? Container(
                               width: 170,
                               height: 195,
                               child: ClipRRect(
                                   borderRadius: BorderRadius.circular(10),
                                   child: Image.asset('assets/media.png', fit: BoxFit.fill,)),)  :   Container(
                                    width: 170,
                                    height: 195,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: CachedNetworkImage(
                                         imageUrl: dat.media,
                                          errorWidget: (context, err, child) => Image.asset('assets/media.png'),
                                          fit: BoxFit.fill,
                                        ))
                               ,),


                                ],
                              ),
                            ),
                          );
                        }
                    );
                  },
                  error: (err, stack){
                    print(err);
                    return Center(child: Text('something went wrong'),);
                  },
                  loading: () => Center(child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),)
              );
            }
          ),
        )
    );
  }
}
