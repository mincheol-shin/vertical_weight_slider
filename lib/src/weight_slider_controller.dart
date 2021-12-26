import 'package:flutter/cupertino.dart';

class WeightSliderController extends FixedExtentScrollController {
  WeightSliderController({
    double initialWeight = 0.0,
    int minWeight = 0,
    double itemExtent = 15.0,
    bool isDoubleInterval = true,
  })  : this.initialWeight = initialWeight,
        this.minWeight = minWeight,
        this.itemExtent = itemExtent,
        this.isDoubleInterval = isDoubleInterval,
        assert(minWeight >= 0),
        assert(itemExtent >= 0),
        super(
          initialItem: ((initialWeight - minWeight) *
                  (isDoubleInterval == true ? 10 : 1.0))
              .toInt(),
        );

  /// The page to show when first creating the scroll view.
  ///
  /// Defaults to 0 and must not be null.
  final double initialWeight;

  /// Minimum weight that the slider can be scrolled
  final int minWeight;

  /// Size of each child in the main axis
  final double itemExtent;

  /// Slider scale type
  final bool isDoubleInterval;

  /// Gap value according to scale type.
  /// double : 0.1
  /// int : 1.0
  int getInterval(){
    return isDoubleInterval ? 10 : 1;
  }

  /// Changes which item index is centered in the controlled scroll view.
  @override
  void jumpToItem(int itemIndex) {
    super.jumpToItem((itemIndex - minWeight) * getInterval());
  }

  @override
  void jumpTo(double value) {
    super.jumpTo(((itemExtent * (value - minWeight)) * getInterval()));
  }
}
