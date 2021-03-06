import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_editor/photo_editor.dart';

class FirstScreenProvider with ChangeNotifier {
  final picker = ImagePicker();

  File _imageFile;
  File get imageFile => _imageFile;

  Filter _filter = presetFilters[0];
  Filter get filter => _filter;

  double _contrast = EditorType.contrast.defaultValue;
  double get contrast => _contrast;

  double _brightness = EditorType.brightness.defaultValue;
  double get brightness => _brightness;

  void getImage() async {
    final imagePicked = await picker.getImage(source: ImageSource.gallery);
    _imageFile = File(imagePicked.path);
    notifyListeners();
  }

  void onFilterSelected(Filter filter) {
    _contrast = EditorType.contrast.defaultValue;
    _brightness = EditorType.brightness.defaultValue;
    _filter = filter;
    notifyListeners();
  }

  void onContrastChanged(double value, Filter filter) {
    _contrast = value;
    _filter = filter;
    notifyListeners();
  }

  void onBrightnessChanged(double value, Filter filter) {
    _brightness = value;
    _filter = filter;
    notifyListeners();
  }

  Future<Uint8List> convertWidgetToImage(RenderRepaintBoundary repaintBoundary) async {
    if (imageFile == null) {
      return null;
    }
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData.buffer.asUint8List();
  }
}
