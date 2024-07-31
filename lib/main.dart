import 'package:flutter/material.dart';
import 'package:videoplayer/Screens/Splash_screen.dart';



void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.orange, brightness: Brightness.dark),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
