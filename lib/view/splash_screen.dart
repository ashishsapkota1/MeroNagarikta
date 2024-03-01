
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:major_project/view/home_screen.dart';
import 'package:major_project/view/my_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            const MyNavBar()
        )
    ));
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage('assets/splash.png'),height: 350,),
          Text('मेरो नागरिकतामा \n तपाईँलाई स्वागत छ।', style: TextStyle(fontSize: 20, ),textAlign: TextAlign.center,)
        ],
      )),
    );

  }
}
