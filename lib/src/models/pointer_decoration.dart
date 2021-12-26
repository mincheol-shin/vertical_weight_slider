import 'package:flutter/material.dart';

class PointerDecoration {
  const PointerDecoration({
    this.width = 130.0,
    this.height = 3.0,
    this.colors = const [Color(0xFF898989), Color(0xFFC5C5C5), Color(0xFFF0F0F0)],
    this.gap = 30.0,
  });

  /// If non-null, requires the child to have exactly this Width.
  final double width;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// The color of the gradation.
  final List<Color> colors;

  /// Gap by Pointer Location.
  final double gap;
}
