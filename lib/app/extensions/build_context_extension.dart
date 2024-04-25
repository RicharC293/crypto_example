import 'package:flutter/material.dart';

extension BuildContextEntension<T> on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get successColor => Theme.of(this).colorScheme.primary;

  Color get infoColor => Theme.of(this).colorScheme.inverseSurface;
}
