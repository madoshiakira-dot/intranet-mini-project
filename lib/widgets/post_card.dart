import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final int likes;
  const PostCard({Key? key, required this.text, required this.imageUrl, required this.likes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(text),
        subtitle: imageUrl.isNotEmpty ? Image.network(imageUrl) : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(likes.toString()),
            Icon(Icons.thumb_up),
          ],
        ),
      ),
    );
  }
}
