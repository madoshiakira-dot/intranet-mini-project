import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../posts/feed_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterIntra'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => auth.logout(),
          )
        ],
      ),
      body: FeedPage(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/createPost'),
      ),
    );
  }
}
