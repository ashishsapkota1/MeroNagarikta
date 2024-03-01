import 'package:flutter/material.dart';
import 'package:major_project/res/space.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        children: [
          Text('Photo Example'),
          Row(
            children: [
              Image(image: AssetImage('assets/demo3.jpg'),height: 250,width: 250,),
              horizontalSpacing(space: 4),
              Icon(Icons.check_circle, color: Colors.green,size: 50,)
            ],
          ),
          Row(
            children: [
              Image(image: AssetImage('assets/demo2.jpg'),height: 250,width: 250,),
              horizontalSpacing(space: 4),
              Icon(Icons.check_circle, color: Colors.green,size: 50,)
            ],
          ),
          Row(
            children: [
              const Image(image: AssetImage('assets/demo1.jpg'),height: 250,width: 250,),
              horizontalSpacing(space: 4),
              const Icon(Icons.close_rounded, color: Colors.red,size: 50,)
            ],
          )
        ],
      ),
    );
  }
}
