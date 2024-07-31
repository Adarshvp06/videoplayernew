import 'package:flutter/material.dart';
import 'package:videoplayer/customwidgets/Custom_listtile.dart';

class Onlinepage extends StatelessWidget {
  const Onlinepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return CustomListtile(
         
          titletext: "Fast and Furious",
          timetext: "2:56:23",
          dismissiblekey: "", thumbnail: Icon(Icons.person_off_outlined), onTap: () {  },
        );
      }),
    );
  }
}
