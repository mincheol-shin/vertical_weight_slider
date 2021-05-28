import 'package:flutter/cupertino.dart';

class WeightSliderController extends FixedExtentScrollController {
  WeightSliderController({
    this.initialWeight = 0,
    this.minWeight = 0,
  })  : assert(minWeight >= 0),
        super(
          initialItem: ((initialWeight - minWeight) * 10).toInt(),
        );

  /// The page to show when first creating the scroll view.
  ///
  /// Defaults to 0 and must not be null.
  final double initialWeight;

  /// Minimum weight that the slider can be scrolled
  final int minWeight;
}
