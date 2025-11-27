import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../services/post_service.dart';

class CreatePostPage extends StatefulWidget {
  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final textController = TextEditingController();
  File? imageFile;
  final picker = ImagePicker();
  final postService = PostService();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Create post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: textController, decoration: InputDecoration(hintText: 'Write something...')),
            SizedBox(height: 12),
            if (imageFile != null) Image.file(imageFile!, height: 200),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final img = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
                    if (img != null) setState(() => imageFile = File(img.path));
                  },
                  child: Text('Pick image'),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    String imageUrl = '';
                    if (imageFile != null) imageUrl = await postService.uploadImage(imageFile!);
                    await postService.createPost(auth.user!.uid, textController.text.trim(), imageUrl);
                    Navigator.pop(context);
                  },
                  child: Text('Post'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
