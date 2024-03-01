import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';

class MySavedFiles extends StatefulWidget {
  const MySavedFiles({super.key});

  @override
  State<MySavedFiles> createState() => _MySavedFilesState();
}

class _MySavedFilesState extends State<MySavedFiles> {
  List<FileSystemEntity> file = [];

  @override
  void initState() {
    super.initState();
    getFiles();
  }

  Future<void> getFiles() async {
    try {
      Directory? directory = await getExternalStorageDirectory();
      List<FileSystemEntity> fileList = directory?.listSync() ?? [];
      setState(() {
        file = fileList;
      });
    } catch (e) {
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: file.length,
        itemBuilder: (context, index) {
          if (file.isEmpty) {
            return const Center(child: Text('No File Found',
              style: TextStyle(color: Colors.red, fontSize: 16),));
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8,top: 8),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: (){
                    OpenFile.open(file[index].path);
                  },
                  title: Text(file[index].path
                      .split('/')
                      .last),
                ),
              ),
            );
          }
        });
  }
}
