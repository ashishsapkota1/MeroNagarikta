import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:major_project/res/space.dart';
import 'package:major_project/view/result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _frontImage;
  File? _backImage;

  Future _pickFrontImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage == null) {
        if (kDebugMode) {
          print("No photo Selected");
        }
      } else {
        _frontImage = File(pickedImage.path);
      }
    });
  }

  Future _pickBackImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage == null) {
        if (kDebugMode) {
          print("No photo Selected");
        }
      } else {
        _backImage = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          verticalSpacing(space: 8),
          showImage(_frontImage),
          verticalSpacing(space: 4),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  _pickFrontImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload),
                    horizontalSpacing(space: 4),
                    const Text('Select Front Image'),
                  ],
                )),
          ),
          verticalSpacing(space: 8),
          showImage(_backImage),
          verticalSpacing(space: 4),
          SizedBox(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  _pickBackImage();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   const Icon(Icons.upload),
                    horizontalSpacing(space: 4),
                    const Text('Select Back Image'),
                  ],
                )),
          ),
          verticalSpacing(space: 20),
          ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      top: 5, bottom: 5, left: 60, right: 60)),
                  backgroundColor: MaterialStateProperty.all(Colors.teal)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(frontImage: _frontImage,backImage: _backImage,)));
              },
              child: const Text(
                'Fetch',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        ],
      ),
    ));
  }

  showImage(File? img) {
    if (img != null) {
      return Card(
          child: Container(
        height: 200,
        padding: const EdgeInsets.all(10.0),
        width: 200,
        child: Image.file(img),
      ));
    } else {
      return Card(
          child: Container(
        height: 200,
        padding: const EdgeInsets.all(10.0),
        width: 200,
        child: Image.asset('assets/image_placeholder.jpg'),
      ));
    }
  }
}
