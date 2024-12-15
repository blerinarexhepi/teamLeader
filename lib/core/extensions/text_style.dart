import 'double.dart';
import 'package:flutter/material.dart';

extension ResponsiveTextStyleValue on TextStyle? {
  TextStyle? r(Size size) {
    return this?.copyWith(fontSize: this!.fontSize.w(size));
  }
}
