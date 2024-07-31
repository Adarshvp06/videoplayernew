import 'package:flutter/material.dart';
import 'package:videoplayer/customwidgets/customappbar.dart';

class Browserscreen extends StatelessWidget {
  const Browserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbaricons: [
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ]),
    );
  }
}
