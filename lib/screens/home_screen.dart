import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/provider/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
      child: Consumer(builder: (context, ref, child) {
        final news = ref.watch(newsProvider);
        return news.isEmpty ? Center(child: CircularProgressIndicator(),) : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                 // controller: searchController,
                  onFieldSubmitted: (val){
                    ref.read(newsProvider.notifier).searchNews(query: val);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    hintText: 'search for latest news',
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 720,
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: news.length,
                    itemBuilder: (context, index) {
                      final dat = news[index];
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
                                    Text(
                                      dat.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                      TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      dat.summary,
                                      maxLines: 5,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.blueGrey),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                      child: Text(
                                        dat.author,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                      dat.published_date,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 170,
                                height: 195,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: dat.media == '' ? Image.asset('assets/images/no-image.jpg') : CachedNetworkImage(
                                    imageUrl: dat.media,
                                    errorWidget: (context, url, error) =>  Image.asset('assets/images/no-image.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
