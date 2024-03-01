import 'package:flutter/material.dart';
import 'package:major_project/view/my_nav_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}


