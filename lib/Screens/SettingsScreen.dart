import 'package:flutter/material.dart';
import 'package:videoplayer/customwidgets/customappbar.dart';

class Settingsscreen extends StatelessWidget {
  const Settingsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(appbaricons: [IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined))],),
      
    );
  }

}