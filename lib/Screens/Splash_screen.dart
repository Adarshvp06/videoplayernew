import 'dart:async';

import 'package:flutter/material.dart';
import 'package:videoplayer/customwidgets/custombottomnav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
super.initState();

Timer(Duration(seconds: 3), ()
  => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return Custombottomnav();
  }))
);
  
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        color: Colors.black,
        child: Center(child: Image.asset("assets/splashscreenlogo.png",height: 150,width: 150,)),
      ),
    );
  }
}