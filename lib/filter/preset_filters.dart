import 'package:flutter/material.dart';
import 'package:photo_editor/filter/filter.dart';

class NoFilter extends Filter {
  static const colorMatrix = <double> [
    1.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ];

  NoFilter() : super('No Filter', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class PurpleFilter extends Filter {
  static const colorMatrix = <double> [
    1.0, -0.2, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, -0.1, 0.0,
    0.0, 1.2, 1.0, 0.1, 0.0,
    0.0, 0.0, 1.7, 1.0, 0.0,
  ];
  PurpleFilter() : super('Purple', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class YellowFilter extends Filter {
  static const colorMatrix = <double> [
    1.0, 0.0, 0.0, 0.0, 0.0,
    -0.2, 1.0, 0.3, 0.1, 0.0,
    -0.1, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ];

  YellowFilter() : super('Yellow', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class CyanFilter extends Filter {
  static const colorMatrix = <double> [
    1.0, 0.0, 0.0, 1.9, -2.2,
    0.0, 1.0, 0.0, 0.0, 0.3,
    0.0, 0.0, 1.0, 0.0, 0.5,
    0.0, 0.0, 0.0, 1.0, 0.2,
  ];

  CyanFilter() : super('Cyan', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class BlackWhiteFilter extends Filter {
  static const colorMatrix = <double> [
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 1.0, 0.0,
  ];

  BlackWhiteFilter() : super('Black and White', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class OldTimesFilter extends Filter {
  static const colorMatrix = <double> [
    1.0, 0.0, 0.0, 0.0, 0.0,
    -0.4, 1.3, -0.4, 0.2, -0.1,
    0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ];

  OldTimesFilter() : super('Old Times', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class ColdLifeFilter extends Filter {
  static const colorMatrix = <double> [
    1.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    -0.2, 0.2, 0.1, 0.4, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ];

  ColdLifeFilter() : super('Cold Life', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class SepiumFilter extends Filter {
  static const colorMatrix = <double> [
    1.3, -0.3, 1.1, 0.0, 0.0,
    0.0, 1.3, 0.2, 0.0, 0.0,
    0.0, 0.0, 0.8, 0.2, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ];

  SepiumFilter() : super('Sepium', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

class MilkFilter extends Filter {
  static const colorMatrix = <double> [
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 0.6, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ];

  MilkFilter() : super('Milk', ColorFilter.matrix(colorMatrix));

  @override
  List<double> get matrix => colorMatrix;
}

List<Filter> presetFilters = [
  NoFilter(),
  PurpleFilter(),
  YellowFilter(),
  CyanFilter(),
  BlackWhiteFilter(),
  OldTimesFilter(),
  ColdLifeFilter(),
  SepiumFilter(),
  MilkFilter(),
];
