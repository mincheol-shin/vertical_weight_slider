import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/src/widgets/weight_pointer.dart';

import '../vertical_weight_slider.dart';

class VerticalWeightSlider extends StatelessWidget {
  const VerticalWeightSlider({
    Key? key,
    required this.controller,
    this.maxWeight = 300,
    this.height = 250,
    this.decoration = const PointerDecoration(),
    this.indicator,
    required this.onChanged,
    this.isVertical = true,
    this.haptic = Haptic.none,
    this.diameterRatio = 3.0,
  })  : assert(maxWeight >= 0),
        super(key: key);

  /// A controller for scroll views whose items have the same size.
  final WeightSliderController controller;

  /// Maximum weight that the slider can be scrolled
  final int maxWeight;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// Pointer configuration
  final PointerDecoration decoration;

  /// Describes the configuration for a vertical weight slider.
  final Widget? indicator;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<double> onChanged;

  /// A Boolean value that indicates whether the slider is vertical.
  final bool isVertical;

  /// Allows access to the haptic feedback interface on the device.
  final Haptic haptic;

  /// A ratio between the diameter of the cylinder and the viewport's size in the main axis.
  final double diameterRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RotatedBox(
        quarterTurns: isVertical ? 0 : 3,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListWheelScrollView(
              itemExtent: controller.itemExtent,
              diameterRatio: diameterRatio,
              controller: controller,
              physics: const FixedExtentScrollPhysics(),
              perspective: 0.01,
              children: List<Widget>.generate(
                [
                  for (int i =
                          controller.minWeight * controller.getIntervalToInt();
                      i <= maxWeight * controller.getIntervalToInt();
                      i++)
                    i
                ].length,
                (index) => Center(
                    child: index % 10 == 0
                        ? WeightPointer(
                            color: decoration.largeColor,
                            width: decoration.width,
                            height: decoration.height)
                        : index % 5 == 0
                            ? WeightPointer(
                                color: decoration.mediumColor,
                                width: decoration.width - decoration.gap,
                                height: decoration.height - 1)
                            : WeightPointer(
                                color: decoration.smallColor,
                                width: decoration.width - (decoration.gap * 2),
                                height: decoration.height - 1)),
              ),
              onSelectedItemChanged: (index) {
                onChanged((index / controller.getIntervalToInt()) +
                    controller.minWeight);
                haptic.run();
              },
            ),
            indicator ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
