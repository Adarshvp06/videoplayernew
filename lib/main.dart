import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer/Screens/splash_screen.dart';
import 'package:videoplayer/providers/bottom_provider.dart';
import 'package:videoplayer/providers/button_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return Buttonprovider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return BottomProvider();
          },
        )
      ],
      child: MaterialApp(
        theme:
            ThemeData(primaryColor: Colors.orange, brightness: Brightness.dark),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
