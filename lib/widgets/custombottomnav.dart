import 'package:flutter/material.dart';
import 'package:videoplayer/Screens/First_screen.dart';
import 'package:videoplayer/Screens/SettingsScreen.dart';
import 'package:videoplayer/Screens/audioscreen.dart';
import 'package:videoplayer/Screens/browserscreen.dart';

class Custombottomnav extends StatefulWidget {
  const Custombottomnav({super.key});

  @override
  State<Custombottomnav> createState() => _CustombottomnavState();
}

class _CustombottomnavState extends State<Custombottomnav> {
  int initialstate = 0;
  // final PageController _pagecontroller = PageController();
  List<Widget> pages = [FirstScreen(),Audioscreen(),Browserscreen(), Settingsscreen()];
  void ontapped(int index) {
    setState(() {
      initialstate = index;
      // _pagecontroller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialstate,
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
              label: "Browser"), BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Setttings"),
        ],
        onTap: ontapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
      ),
      body: pages[initialstate],
      // PageView(
      //   controller: _pagecontroller,
      //   children: [Videoscreen(), Settingsscreen()],
      // ),
    );
  }
}
