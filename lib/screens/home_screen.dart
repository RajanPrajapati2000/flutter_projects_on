import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/provider/news_provider.dart';
import 'package:flutter_project/widgets/tab_bar_widgets.dart';
import 'package:flutter_project/widgets/web_view_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



class HomeScreen extends StatelessWidget {


 final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.purple,
            bottom: TabBar(
                tabs: [
                  Tab(
                    text: 'Game',
                    icon: Icon(Icons.add_circle_outlined),
                  ),
                  Tab(
                    text: 'Movie',
                    icon: Icon(Icons.event),
                  ),
                  Tab(
                    text: 'Crime',
                    icon: Icon(Icons.map),
                  ),
                ]
            ),
          ),
          body: SafeArea(
            child: Consumer(
                builder: (context, ref, child){
                  final news = ref.watch(newsProvider);
                  return   Column(
                    children: [
                      Container(
                        height: 200,
                        child: TabBarView(
                            children: [
                          TabBarWidget(category: 'Game'),
                          TabBarWidget(category: 'movie',),
                          TabBarWidget(category: 'Crimes',),
                        ]),
                      ),
                      Column(
                        children: [
                          Container(
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                child: TextFormField(
                                  controller: searchController,
                                  onFieldSubmitted: (val){
                                    ref.read(newsProvider.notifier).searchNews(val);
                                    searchController.clear();
                                  },
                                  onChanged: (val){

                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        onPressed: (){
                                          FocusScope.of(context).unfocus();
                                         ref.read(newsProvider.notifier).searchNews(searchController.text.trim());
                                         searchController.clear();
                                        }, icon: Icon(Icons.search)),
                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    hintText: 'Search for news',
                                    border: OutlineInputBorder()
                                  ),
                                ),
                              )),
                       news.isEmpty ? Container(
                         height: MediaQuery.of(context).size.height - 470,
                         child: Center(child: CircularProgressIndicator(
                           color: Colors.purple,
                         ),),
                       ) : news[0].title == 'not found' ? Container(
                         margin: EdgeInsets.only(top: 20),
                         child: Text('No matches for your search.', style: TextStyle(fontSize: 16),),)  : Container(
                         height: MediaQuery.of(context).size.height - 470,
                         child: ListView.builder(
                           shrinkWrap: true,
                                itemCount: news.length,
                                itemBuilder: (context, index){
                                  final dat = news[index];
                                  print(news[0].media);
                                  return InkWell(
                                    onTap: (){
                                      Get.to(() => WebViewWidget(dat.link));
                                    },
                                    child: Card(
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
                                                  child: Image.asset('assets/images/no-image.jpg', fit: BoxFit.fill,)),)  :   Container(
                                              width: 170,
                                              height: 195,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    imageUrl: dat.media,
                                                    errorWidget: (context, err, child) => Image.asset('assets/images/no-image.jpg'),
                                                    fit: BoxFit.fill,
                                                  ))
                                              ,),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                       ),
                        ],
                      ),
                    ],
                  );
                }
            ),
          )
      ),
    );
  }
}
