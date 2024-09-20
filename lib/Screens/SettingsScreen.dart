import 'package:flutter/material.dart';
import 'package:videoplayer/widgets/custom_appbar.dart';

class Settingsscreen extends StatefulWidget {
  const Settingsscreen({super.key});

  @override
  State<Settingsscreen> createState() => _SettingsscreenState();
}

class _SettingsscreenState extends State<Settingsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbaricons: [IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined))],),
      
    );
  }
}