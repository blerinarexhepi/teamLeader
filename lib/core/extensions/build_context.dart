import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  // Size get screenSize => MediaQuery.of(this).size;
  Size get screenSize => MediaQuery.sizeOf(this);
}

extension ThemeText on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension Platform on BuildContext {
  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
}

extension CustomFocusScope on BuildContext {
  FocusScopeNode get focusScope => FocusScope.of(this);
}
