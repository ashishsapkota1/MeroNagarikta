import 'package:flutter/material.dart';
import 'package:major_project/view/about_us.dart';
import 'package:major_project/view/home_screen.dart';
import 'package:major_project/view/saved_files.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int selectedIndex = 0;
  late List<Widget> currentTab;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    currentTab = [const HomeScreen(), const MySavedFiles(), const AboutUs()];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text('Mero Nagarikta'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Color(0xffF7F7F7),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: ''),
        ],
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme:
            const IconThemeData(color: Colors.teal, fill: 0.1, size: 30),
        onTap: _onItemTapped,
      ),
      body: currentTab[selectedIndex],
    );
  }
}
