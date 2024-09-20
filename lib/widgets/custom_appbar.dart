import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

// ignore: must_be_immutable
class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  Customappbar({super.key, required this.appbaricons});

  List<IconButton> appbaricons = [];

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        actions: appbaricons);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
