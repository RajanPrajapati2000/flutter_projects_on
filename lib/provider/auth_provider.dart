import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';




final authStatusProvider = StreamProvider.autoDispose((ref) => FirebaseAuth.instance.authStateChanges());

final authProvider = Provider.autoDispose((ref) => AuthProvider());
class AuthProvider {

  CollectionReference dbUsers = FirebaseFirestore.instance.collection('users');

  Future<void> userSignUp({required String username, required String email,
    required String password, required XFile image}) async{
    try{
      UserCredential response = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      final imageId = DateTime.now().toString();
      final ref =  FirebaseStorage.instance.ref().child('userImage/$imageId');
      final imageFile = File(image.path);
         await ref.putFile(imageFile);
     final url = await ref.getDownloadURL();

    await dbUsers.add({
       'username': username,
       'imageUrl': url,
      'email': email,
       'userId': response.user!.uid,
     });


    }on FirebaseAuthException catch(err){
      print(err);
    }

  }



  Future<void> userSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (err) {
      print(err);
    }
  }




  Future<String> userSignIn({ required String email, required String password}) async{
    try{
      UserCredential response = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
  return 'success';
    }on FirebaseAuthException catch(err){
      return'${err.message}';
    }

  }








}