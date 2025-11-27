import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostService {
  final CollectionReference posts = FirebaseFirestore.instance.collection('posts');

  Future<String> uploadImage(File file) async {
    final path = 'posts/${DateTime.now().millisecondsSinceEpoch}.jpg';
    final ref = FirebaseStorage.instance.ref().child(path);
    await ref.putFile(file);
    return await ref.getDownloadURL();
  }

  Future<void> createPost(String userId, String text, String imageUrl) async {
    final id = posts.doc().id;
    await posts.doc(id).set({
      'id': id,
      'userId': userId,
      'text': text,
      'imageUrl': imageUrl,
      'likes': 0,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getPosts() {
    return posts.orderBy('createdAt', descending: true).snapshots();
  }

  Future<void> likePost(String id) {
    return posts.doc(id).update({'likes': FieldValue.increment(1)});
  }
}
