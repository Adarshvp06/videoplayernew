import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:videoplayer/Screens/Offlinepage.dart';
import 'package:videoplayer/Screens/onlinepage.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.replay),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset("assets/applogo.png"),
          title: AnimatedTextKit(
            isRepeatingAnimation: true,
            repeatForever: true,
            animatedTexts: [
              ColorizeAnimatedText(
                "VIDEO PLAYER",
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                colors: [
                  Colors.purple,
                  Colors.lightBlue,
                  Colors.pink,
                  Colors.yellow,
                  Colors.orange
                ],
                speed: const Duration(seconds: 1),
              )
            ],
          ),
          actions: [icons],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "OFFLINE",
              ),
              Tab(
                text: "ONLINE",
              ),
            ],
            labelColor: Colors.orange,
            indicatorColor: Colors.orange,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        body: const TabBarView(
          children: [
            Offlinepage(),
            Onlinepage(),
          ],
        ),
      ),
    );
  }
}
