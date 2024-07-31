import 'package:flutter/material.dart';
import 'package:videoplayer/customwidgets/customappbar.dart';

class Audioscreen extends StatelessWidget {
  const Audioscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbaricons: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.replay)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
      ]),
    );
  }
}
