import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editor/photo_editor.dart';
import 'package:example/second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _globalKey = GlobalKey();
  final picker = ImagePicker();

  File imageFile;
  Filter filter = presetFilters[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo editor test'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: _getImage,
          ),
          IconButton(
            icon: Icon(Icons.check),
            onPressed: convertWidgetToImage,
          ),
        ],
      ),
      body: _handleState(),
    );
  }

  Widget _handleState() {
    if (imageFile != null) {
      return Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: _globalKey,
              child: ColorFiltered(
                colorFilter: filter.filter,
                child: Image.file(imageFile),
              ),
            ),
          ),
          FilterList(
            filters: presetFilters,
            image: FileImage(imageFile),
            onFilterSelected: _onFilterSelected,
          ),
        ],
      );
    }
    return Center(
      child: Text('Test'),
    );
  }

  void _onFilterSelected(Filter filter) {
    setState(() {
      this.filter = filter;
    });
  }

  void _getImage() async {
    final imagePicked = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(imagePicked.path);
    });
  }

  void convertWidgetToImage() async {
    if (imageFile == null) {
      return;
    }
    RenderRepaintBoundary repaintBoundary = _globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    Navigator.of(_globalKey.currentContext).push(MaterialPageRoute(
        builder: (context) => SecondScreen(
          imageData: uint8list,
        )));
  }
}
