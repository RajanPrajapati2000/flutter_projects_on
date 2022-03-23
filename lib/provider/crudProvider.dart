import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_project/models/post.dart';
import 'package:flutter_project/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';


final crudProvider = Provider.autoDispose((ref) => CrudProvider());
final postProvider = StreamProvider.autoDispose((ref) => CrudProvider().getData());
final userProvider = StreamProvider.autoDispose((ref) => CrudProvider().geUserData());

class CrudProvider{
  CollectionReference dbPosts = FirebaseFirestore.instance.collection('posts');
  CollectionReference dbUsers = FirebaseFirestore.instance.collection('users');

  Future<String> postAdd({required String title, required String description, required XFile image,
    required String userId}) async{
    try{

      final imageId = DateTime.now().toString();
      final ref =  FirebaseStorage.instance.ref().child('postImage/$imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbPosts.add({
        'title': title,
        'imageUrl': url,
        'description': description,
        'userId': userId,
        'imageId': imageId
      });
 return 'success';
    }on FirebaseException catch(err){
      return '${err.message}';
    }

  }


  Stream<List<Post>> getData(){
     return dbPosts.snapshots().map((event) => getPostsData(event));
  }

  List<Post> getPostsData(QuerySnapshot querySnapshot){
     return querySnapshot.docs.map((e){
       final json = e.data() as Map<String, dynamic>;
       return Post(
           imageId: json['imageId'],
           id: e.id,
           userId: json['userId'],
           description: json['description'],
           title: json['title'],
           imageUrl: json['imageUrl']
       );
     }).toList();
  }


  Stream<List<User>> geUserData(){
    return dbUsers.snapshots().map((event) => UserData(event));
  }
  List<User> UserData(QuerySnapshot querySnapshot){
    return querySnapshot.docs.map((e) => User.fromJson((e.data() as Map<String, dynamic>))).toList();
  }



}