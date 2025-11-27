import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/post_service.dart';

class FeedPage extends StatelessWidget {
  final PostService postService = PostService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: postService.getPosts(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
        final docs = snapshot.data!.docs;
        if (docs.isEmpty) return Center(child: Text('No posts yet'));
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, i) {
            final p = docs[i];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListTile(
                title: Text(p['text'] ?? ''),
                subtitle: p['imageUrl'] != null && (p['imageUrl'] as String).isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Image.network(p['imageUrl']),
                      )
                    : null,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(p['likes'].toString()),
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () => postService.likePost(p['id']),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
