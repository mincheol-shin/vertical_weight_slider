import 'package:flutter/material.dart';

class WeightPointer extends StatelessWidget {
  const WeightPointer({
    Key? key,
    this.width = 130.0,
    this.height = 3.0,
    this.color = Colors.grey,
  }) : super(key: key);

  /// If non-null, requires the child to have exactly this Width.
  final double width;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// The color of the gradation.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: color,
        ),
      ),
    );
  }
}
