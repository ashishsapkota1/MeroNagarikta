import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../res/app_url.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  File? _image;

  Future _pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage == null) {
        print("No photo Selected");
      } else {
        _image = File(pickedImage.path);
      }
    });
  }

  Future<void> uploadPhoto() async {
    try {
      List<int> imageBytes = _image!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      Map<String, dynamic> requestData = {'image' :base64Image};
      final url = AppUrl.postUrl;

    }catch(e){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Mero Nagarikta'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  child: const Text('select photo')))
        ],
      ),
    );
  }

}
