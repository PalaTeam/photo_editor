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

  File _imageFile;
  Filter _filter = presetFilters[0];
  double _contrast = EditorType.contrast.defaultValue;
  double _brightness = EditorType.brightness.defaultValue;

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
    if (_imageFile != null) {
      return Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: _globalKey,
              child: ColorFiltered(
                colorFilter: _filter.filter,
                child: Image.file(_imageFile),
              ),
            ),
          ),
          FilterList(
            filters: presetFilters,
            image: FileImage(_imageFile),
            onFilterSelected: _onFilterSelected,
          ),
          Editor(
            editorType: EditorType.contrast,
            filter: _filter,
            value: _contrast,
            onValueChanged: _onContrastChanged,
          ),
          Editor(
            editorType: EditorType.brightness,
            filter: _filter,
            value: _brightness,
            onValueChanged: _onBrightnessChanged,
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
      _contrast = EditorType.contrast.defaultValue;
      _brightness = EditorType.brightness.defaultValue;
      _filter = filter;
    });
  }

  void _onContrastChanged(double value, Filter filter) {
    setState(() {
      _contrast = value;
      _filter = filter;
    });
  }

  void _onBrightnessChanged(double value, Filter filter) {
    setState(() {
      _brightness = value;
      _filter = filter;
    });
  }

  void _getImage() async {
    final imagePicked = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = File(imagePicked.path);
    });
  }

  void convertWidgetToImage() async {
    if (_imageFile == null) {
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
