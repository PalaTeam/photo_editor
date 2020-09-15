import 'dart:typed_data';

import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final Uint8List imageData;

  const SecondScreen({Key key, this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Image'),
      ),
      body: Center(
        child: Image.memory(
          imageData,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
