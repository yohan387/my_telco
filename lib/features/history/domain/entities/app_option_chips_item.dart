import 'package:flutter/material.dart';

class AppOptionChipsItem<T> {
  final T value;
  final String label;
  final Widget icon;

  AppOptionChipsItem({
    required this.value,
    required this.label,
    required this.icon,
  });
}
