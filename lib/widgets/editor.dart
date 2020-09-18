import 'package:flutter/material.dart';
import 'package:photo_editor/filter/filter.dart';

class Editor extends StatelessWidget {
  final EditorType editorType;
  final Filter filter;
  final double value;
  final OnValueChanged onValueChanged;
  final Color activeColor;
  final Color inactiveColor;

  const Editor({
    Key key,
    @required this.editorType,
    @required this.filter,
    @required this.value,
    @required this.onValueChanged,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      value: value,
      max: editorType.max,
      min: editorType.min,
      onChanged: _onChanged,
    );
  }

  void _onChanged(double value) {
    final matrix = List<double>.from(filter.matrix);
    if (editorType == EditorType.contrast) {
      matrix[0] = value;
      matrix[6] = value;
      matrix[12] = value;
    } else {
      matrix[4] = value;
      matrix[9] = value;
      matrix[14] = value;
    }
    onValueChanged(value, CustomFilter(matrix));
  }
}

enum EditorType {
  contrast,
  brightness
}

extension EditorTypeExtension on EditorType {
  double get defaultValue => {
    EditorType.contrast: 1.0,
    EditorType.brightness: 0.0,
  }[this];

  double get max => {
    EditorType.contrast: 2.0,
    EditorType.brightness: 255.0,
  }[this];

  double get min => {
    EditorType.contrast: 0.0,
    EditorType.brightness: -255.0,
  }[this];
}

typedef void OnValueChanged(double value, Filter filter);
