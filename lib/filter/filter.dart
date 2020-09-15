import 'package:flutter/material.dart';

abstract class Filter {
  final String name;
  final ColorFilter filter;

  Filter(this.name, this.filter);
}
