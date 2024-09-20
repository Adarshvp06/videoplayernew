import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer/Screens/first_screen.dart';
import 'package:videoplayer/Screens/settingsScreen.dart';
import 'package:videoplayer/Screens/audioscreen.dart';
import 'package:videoplayer/Screens/browserscreen.dart';
import 'package:videoplayer/providers/bottom_provider.dart';

class Custombottomnav extends StatefulWidget {
  Custombottomnav({super.key});

  @override
  State<Custombottomnav> createState() => _CustombottomnavState();
}

class _CustombottomnavState extends State<Custombottomnav> {
  List<Widget> pages = [
    const FirstScreen(),
    const Audioscreen(),
    const Browserscreen(),
    const Settingsscreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Consumer<BottomProvider>(
          builder: (BuildContext context, value, Widget? child) =>
              BottomNavigationBar(
            currentIndex: value.currentinddex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.video_library_rounded,
                  ),
                  label: "Video"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.audio_file_rounded,
                  ),
                  label: "Audio"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.folder,
                  ),
                  label: "Browser"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Setttings"),
            ],
            onTap: (int index) {
              value.changeindex(index);
            },
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: false,
          ),
        ),
        body: Consumer<BottomProvider>(builder: (context, value, child) {
          return pages[value.currentinddex];
        }));
  }
}
