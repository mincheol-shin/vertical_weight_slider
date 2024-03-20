import 'package:flutter/cupertino.dart';

class WeightSliderController extends FixedExtentScrollController {
  WeightSliderController({
    double initialWeight = 0.0,
    int minWeight = 0,
    double itemExtent = 15.0,
    double interval = 1.0,
  })  : this.initialWeight = initialWeight,
        this.minWeight = minWeight,
        this.itemExtent = itemExtent,
        this.interval = 1 * (1 / interval),
        assert(minWeight >= 0),
        assert(itemExtent >= 0),
        assert(interval <= 1.0),
        super(
          initialItem:
              ((initialWeight - minWeight) * (1 * (1 / interval))).toInt(),
        );

  /// The page to show when first creating the scroll view.
  ///
  /// Defaults to 0 and must not be null.
  final double initialWeight;

  /// Minimum weight that the slider can be scrolled
  final int minWeight;

  /// Size of each child in the main axis
  final double itemExtent;

  /// Gap value according to scale type.
  final double interval;

  int getIntervalToInt() => interval.toInt();

  /// Changes which item index is centered in the controlled scroll view.
  @override
  void jumpToItem(int weight) {
    super.jumpToItem((weight - minWeight) * getIntervalToInt());
  }

  @override
  void jumpTo(double weight) {
    super.jumpTo(((itemExtent * (weight - minWeight)) * interval));
  }
}
