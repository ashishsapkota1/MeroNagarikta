import 'package:flutter/material.dart';
import 'package:major_project/view/about_us.dart';
import 'package:major_project/view/help.dart';
import 'package:major_project/view/home_screen.dart';
import 'package:major_project/view/saved_files.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int selectedIndex = 0;
  late List<Widget> currentTab ;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    currentTab = [const HomeScreen(), const HowToUse(), const AboutUs(), const MySavedFiles()];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text('Mero Nagarikta'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
          backgroundColor: Colors.white70,
          items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.black54,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help,color: Colors.black54,),
          label: 'Help',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.info_outline,color: Colors.black54,),
            label: 'About Us'
        ),
            BottomNavigationBarItem(
                icon: Icon(Icons.file_copy_outlined,color: Colors.black54,),
                label: 'Files'
            )
      ],
        currentIndex: selectedIndex,
        selectedFontSize: 16,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
      body: currentTab[selectedIndex],
    );
  }
}
