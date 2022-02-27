import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/models/news.dart';
import 'package:flutter_project/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class TabBarWidget extends StatelessWidget {
final String category;
TabBarWidget({ required this.category});
  @override
  Widget build(BuildContext context) {
    return  Consumer(
      builder: (context, ref, child) {
        final news = ref.watch(queryProvider(category));
        return Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: news.length,
              itemBuilder: (context, index) {
                final dat = news[index];
                print(news[0].media);
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(7),
                    width: 260,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dat.title, maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w500),),
                              SizedBox(height: 7,),
                              Text(dat.summary, maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.blueGrey),),
                            ],
                          ),
                        ),


                        SizedBox(width: 10,),
                        dat.media == '' ? Container(
                          width: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset('assets/images/no-image.jpg',
                                fit: BoxFit.fill,)),) : Container(
                          width: 50,
                          height: 195,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: dat.media,
                                errorWidget: (context, err, child) =>
                                    Image.asset('assets/images/no-image.jpg'),
                                fit: BoxFit.fill,
                              ))
                          ,),
                      ],
                    ),
                  ),
                );
              }
          ),
        );
      }
    );
  }
}
