import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/src/weight_pointer.dart';
import '../vertical_weight_slider.dart';
import 'pointer_config.dart';

class VerticalWeightSlider extends StatelessWidget {
  VerticalWeightSlider({
    Key? key,
    required this.controller,
    this.maxWeight = 300,
    this.height = 250.0,
    required this.config,
    this.indicator,
    required this.onChanged,
    this.isVertical = true,
  })  : assert(maxWeight >= 0),
        super(key: key);

  /// A controller for scroll views whose items have the same size.
  final WeightSliderController controller;

  /// Maximum weight that the slider can be scrolled
  final int maxWeight;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// Pointer configuration
  final PointerConfig config;

  /// Describes the configuration for a vertical weight slider.
  final Widget? indicator;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<double> onChanged;

  /// A Boolean value that indicates whether the slider is vertical.
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          onChanged((controller.selectedItem / 10) + controller.minWeight);
        }
        return false;
      },
      child: SizedBox(
        height: height,
        child: RotatedBox(
          quarterTurns: isVertical ? 0 : 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListWheelScrollView(
                itemExtent: controller.itemExtent,
                diameterRatio: 3.0,
                controller: controller,
                physics: FixedExtentScrollPhysics(),
                perspective: 0.01,
                children: List<Widget>.generate(
                  [
                    for (int i = controller.minWeight * 10;
                        i <= maxWeight * 10.0;
                        i++)
                      i
                  ].length,
                  (index) => Center(
                      child: index % 10 == 0
                          ? WeightPointer(
                              color: config.colors[0]!,
                              width: config.width,
                              height: config.height)
                          : index % 5 == 0
                              ? WeightPointer(
                                  color: config.colors[1]!,
                                  width: config.width - config.gap,
                                  height: config.height - 1)
                              : WeightPointer(
                                  color: config.colors[2]!,
                                  width: config.width - (config.gap * 2),
                                  height: config.height - 1)),
                ),
              ),
              indicator ??
                  Container(
                    height: 3.0,
                    width: 200.0,
                    alignment: Alignment.centerLeft,
                    color: Colors.red[300],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
