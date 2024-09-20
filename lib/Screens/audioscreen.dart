import 'package:flutter/material.dart';
import 'package:videoplayer/widgets/custom_appbar.dart';

class Audioscreen extends StatelessWidget {
  const Audioscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbaricons: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.replay)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ]),
    );
  }
}
