import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/provider/auth_provider.dart';
import 'package:flutter_project/provider/crudProvider.dart';
import 'package:flutter_project/widgets/create_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';



class MainScreen extends StatelessWidget {

  final uid = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              actions: [
                TextButton(
                    onPressed: (){
                      Get.to(() => CreatePage(), transition: Transition.leftToRight);
                    }, child: Text('createPost', style: TextStyle(color: Colors.white),)),
                TextButton(
                    onPressed: (){
                           ref.read(authProvider).userSignOut();
                    }, child: Text('signOut', style: TextStyle(color: Colors.white),))
              ],
            ),
            body: Consumer(
                builder: (context, ref, child) {
                  final postStream = ref.watch(postProvider);
                  final userStream = ref.watch(userProvider);
                  return Column(
                    children: [
                     userStream.when(
                         data: (data){
                           return Container(
                             margin: EdgeInsets.only(top: 10),
                             height: 170,
                             child: ListView.builder(
                               itemCount: data.length,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (context, index){
                                 final dat = data[index];
                                   return Container(
                                     margin: EdgeInsets.only(left: 10, right: 5),
                                     child: Column(
                                       children: [
                                         CircleAvatar(
                                             radius: 50,
                                           backgroundImage: NetworkImage(
                                               dat.imageUrl)
                                         ),
                                         SizedBox(height: 11,),
                                         Text(dat.username)
                                       ],
                                     ),
                                   );
                                 }),
                           );
                         },
                         error: (err, stack) => Text('$err'),
                         loading: () => Container()
                     ),

                      postStream.when(
                          data: (data){
                            return Container(
                              margin: EdgeInsets.only(top: 5),
                              height: 570,
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index){
                                    final dat = data[index];
                                    return  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 7),
                                      child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(child: Text(dat.title,
                                                    maxLines: 2,
                                                    style: TextStyle(fontSize: 16),overflow: TextOverflow.ellipsis,)),
                        if(uid == dat.userId) IconButton(onPressed: (){

                          Get.defaultDialog(
                            title: 'customize your post',
                            content: Text('make'),
                            actions: [
                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){

                          }, icon: Icon(Icons.delete)),
                            ]
                          );

                        }, icon: Icon(Icons.more_horiz_outlined)),
                                                ],
                                              ),
                                              Container(
                                                  height: 220,
                                                  width: double.infinity,
                                                  child: Image.network(dat.imageUrl, fit: BoxFit.cover,)),
                                              SizedBox(height: 10,),
                                              Text(dat.description , style: TextStyle(color: Colors.blueGrey, letterSpacing: 1, fontSize: 16), maxLines: 3,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          },
                          error: (err, stack) => Text('$err'),
                          loading: () => Container()
                      ),


                    ],
                  );
                }
              )
        );
      }
    );
  }
}
