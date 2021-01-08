import 'package:flutter/material.dart';
import 'Login.dart';
import 'start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Homepage.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
