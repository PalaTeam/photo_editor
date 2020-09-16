import 'package:flutter/material.dart';

abstract class Filter {
  final String name;
  final ColorFilter filter;
  List<double> get matrix;

  Filter(this.name, this.filter);
}

class CustomFilter extends Filter {
  final List<double> colorMatrix;

  CustomFilter(this.colorMatrix) : super('Custom', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}
