import 'package:flutter/material.dart';

extension ResponsiveDoubleValue on double? {
  double h(Size size) {
    return this == null ? 0 : (size.height / 844) * this!;
  }

  double w(Size size) {
    return this == null ? 0 : (size.width / 390) * this!;
  }
}