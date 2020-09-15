import 'package:flutter/material.dart';
import 'package:photo_editor/filter/filter.dart';

class NoFilter extends Filter {
  NoFilter() : super('No Filter', ColorFilter.matrix([
    1.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ]));
}

class PurpleFilter extends Filter {
  PurpleFilter() : super('Purple', ColorFilter.matrix([
    1.0, -0.2, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, -0.1, 0.0,
    0.0, 1.2, 1.0, 0.1, 0.0,
    0.0, 0.0, 1.7, 1.0, 0.0,
  ]));
}

class YellowFilter extends Filter {
  YellowFilter() : super('Yellow', ColorFilter.matrix([
    1.0, 0.0, 0.0, 0.0, 0.0,
    -0.2, 1.0, 0.3, 0.1, 0.0,
    -0.1, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ]));
}

class CyanFilter extends Filter {
  CyanFilter() : super('Cyan', ColorFilter.matrix([
    1.0, 0.0, 0.0, 1.9, -2.2,
    0.0, 1.0, 0.0, 0.0, 0.3,
    0.0, 0.0, 1.0, 0.0, 0.5,
    0.0, 0.0, 0.0, 1.0, 0.2,
  ]));
}

class BlackWhiteFilter extends Filter {
  BlackWhiteFilter() : super('Black and White', ColorFilter.matrix([
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 1.0, 0.0,
  ]));
}

class OldTimesFilter extends Filter {
  OldTimesFilter() : super('Old Times', ColorFilter.matrix([
    1.0, 0.0, 0.0, 0.0, 0.0,
    -0.4, 1.3, -0.4, 0.2, -0.1,
    0.0, 0.0, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ]));
}

class ColdLifeFilter extends Filter {
  ColdLifeFilter() : super('Cold Life', ColorFilter.matrix([
    1.0, 0.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    -0.2, 0.2, 0.1, 0.4, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ]));
}

class SepiumFilter extends Filter {
  SepiumFilter() : super('Sepium', ColorFilter.matrix([
    1.3, -0.3, 1.1, 0.0, 0.0,
    0.0, 1.3, 0.2, 0.0, 0.0,
    0.0, 0.0, 0.8, 0.2, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ]));
}

class MilkFilter extends Filter {
  MilkFilter() : super('Milk', ColorFilter.matrix([
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 1.0, 0.0, 0.0, 0.0,
    0.0, 0.6, 1.0, 0.0, 0.0,
    0.0, 0.0, 0.0, 1.0, 0.0,
  ]));
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
