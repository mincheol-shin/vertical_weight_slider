import 'package:flutter/cupertino.dart';

class WeightSliderController extends FixedExtentScrollController {
  WeightSliderController({
    this.initialWeight = 0,
    this.minWeight = 0,
    this.itemExtent = 15.0,
  })  : assert(minWeight >= 0),
        assert(itemExtent >= 0),
        super(
          initialItem: ((initialWeight - minWeight) * 10).toInt(),
        );

  /// The page to show when first creating the scroll view.
  ///
  /// Defaults to 0 and must not be null.
  final double initialWeight;

  /// Minimum weight that the slider can be scrolled
  final int minWeight;

  /// Size of each child in the main axis
  final double itemExtent;

  /// Changes which item index is centered in the controlled scroll view.
  @override
  void jumpToItem(int itemIndex) {
    super.jumpToItem((itemIndex - minWeight) * 10);
  }

  @override
  void jumpTo(double value) {
    super.jumpTo(((itemExtent * (value - minWeight)) * 10));
  }
}
