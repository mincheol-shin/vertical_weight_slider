import 'package:flutter/material.dart';

class PointerConfig {
  PointerConfig({
    this.width = 130.0,
    this.height = 3.0,
    this.colors = const [Colors.grey, Colors.grey, Colors.grey],
    this.gap = 30.0,
  }) : assert(colors.length == 3);

  /// If non-null, requires the child to have exactly this Width.
  final double width;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// The color of the gradation.
  List<Color?> colors;

  /// Gap by Pointer Location.
  final double gap;
}
