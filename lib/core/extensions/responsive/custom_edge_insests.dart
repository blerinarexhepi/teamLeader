import 'package:flutter/material.dart';
import '../double.dart';

class CustomEdgeInsets {
  static EdgeInsets only({
    required Size size,
    double left = 0,
    double right = 0,
    double top = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left == 0 ? 0 : left.w(size),
      right: right == 0 ? 0 : right.w(size),
      top: top == 0 ? 0 : top.h(size),
      bottom: bottom == 0 ? 0 : bottom.h(size),
    );
  }

  static EdgeInsets all({
    required Size size,
    double all = 0,
  }) {
    return EdgeInsets.only(
      left: all == 0 ? 0 : all.w(size),
      right: all == 0 ? 0 : all.w(size),
      top: all == 0 ? 0 : all.h(size),
      bottom: all == 0 ? 0 : all.h(size),
    );
  }

  static EdgeInsets symmetric({
    required Size size,
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal == 0 ? 0 : horizontal.w(size),
      vertical: vertical == 0 ? 0 : vertical.h(size),
    );
  }
}
