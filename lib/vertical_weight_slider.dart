import 'package:flutter/material.dart';

class VerticalWeightSlider extends StatefulWidget {
  VerticalWeightSlider({
    Key key,
    this.minimumWeight = 0,
    this.maximumWeight = 300,
    this.height = 250.0,
    this.gradationWidth = 130.0,
    this.gradationHeight = 3.0,
    this.selectedGradation,
    this.gradationColor,
    this.initialWeight = 0.0,
    this.itemExtent = 15.0,
    this.onChanged,
  })  : assert(itemExtent > 0),
        assert(gradationColor.length == 3),
        super(key: key);

  /// Minimum weight that the slider can be scrolled
  final int minimumWeight;

  /// Maximum weight that the slider can be scrolled
  final int maximumWeight;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// If non-null, requires the child to have exactly this Width.
  final double gradationWidth;

  /// If non-null, requires the child to have exactly this height.
  final double gradationHeight;

  /// The initial weight.
  final double initialWeight;

  /// Size of each child in the main axis
  final double itemExtent;

  /// Describes the configuration for a vertical weight slider.
  final Widget selectedGradation;

  /// On optional listener that's called when the centered item changes.
  final ValueChanged<double> onChanged;

  /// The color of the gradation.
  final List<Color> gradationColor;

  @override
  _VerticalWeightSliderState createState() => _VerticalWeightSliderState();
}

class _VerticalWeightSliderState extends State<VerticalWeightSlider> {
  FixedExtentScrollController _controller;
  List weight;

  @override
  void initState() {
    super.initState();
    weight = [for (int i = widget.minimumWeight; i <= widget.maximumWeight * 10.0; i++) i];
    _controller = FixedExtentScrollController(initialItem: (widget.initialWeight * 10).toInt());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification) {
          widget.onChanged(_controller.selectedItem / 10);
        }
        return false;
      },
      child: SizedBox(
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListWheelScrollView(
              itemExtent: widget.itemExtent,
              diameterRatio: 3.0,
              controller: _controller,
              physics: FixedExtentScrollPhysics(),
              perspective: 0.01,
              children: List<Widget>.generate(
                [for (int i = widget.minimumWeight; i <= widget.maximumWeight * 10.0; i++) i].length,
                    (index) => Center(
                    child: index % 10 == 0
                        ? gradation(color: widget.gradationColor[0] ?? Colors.grey[500], width: widget.gradationWidth, height: widget.gradationHeight)
                        : index % 5 == 0
                        ? gradation(color: widget.gradationColor[1] ?? Colors.grey[400], width: widget.gradationWidth - 30.0, height: widget.gradationHeight - 1)
                        : gradation(color: widget.gradationColor[2] ?? Colors.grey[200], width: widget.gradationWidth - 50.0, height: widget.gradationHeight - 1)),
              ),
            ),
            widget.selectedGradation ??
                Container(
                  height: 3.0,
                  width: 200.0,
                  alignment: Alignment.centerLeft,
                  color: Colors.red[300],
                ),
          ],
        ),
      ),
    );
  }

  Widget gradation({Color color, double width, double height, int index}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color,
      ),
    );
  }
}
