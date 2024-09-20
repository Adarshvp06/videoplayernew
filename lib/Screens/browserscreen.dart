import 'package:flutter/material.dart';
import 'package:videoplayer/widgets/custom_appbar.dart';

class Browserscreen extends StatelessWidget {
  const Browserscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbaricons: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ]),
    );
  }
}
