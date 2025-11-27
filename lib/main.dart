import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// TODO: generate firebase_options.dart with FlutterFire CLI and uncomment:
// import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'views/auth/login_page.dart';
import 'views/home/home_page.dart';
import 'views/posts/create_post_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'FlutterIntra',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (_) => AuthWrapper(),
          '/home': (_) => HomePage(),
          '/createPost': (_) => CreatePostPage(),
        },
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    if (auth.user == null) return LoginPage();
    return HomePage();
  }
}
