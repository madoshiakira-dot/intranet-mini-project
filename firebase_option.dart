import 'package:firebase_core/firebase_core.dart';
/*
Remplacer les valeurs par celles de ton google-services.json :
current_key → apiKey
mobilesdk_app_id → appId
project_id → projectId
storage_bucket → storageBucket
project_number → messagingSenderId*/

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: '...................',
    appId: '......................',
    messagingSenderId: '.............',
    projectId: '.................',
    storageBucket: '...................',
  );

  static FirebaseOptions get currentPlatform {
    return android;
  }
}