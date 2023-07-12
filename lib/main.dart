import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/views/home_view.dart';

import 'package:mycodingsetup/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// if you want use for your environment you should uncomment this line
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
