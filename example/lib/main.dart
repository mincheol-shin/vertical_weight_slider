import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FixedExtentScrollController _controller;
  double _weight = 50.0;
  @override
  void initState() {
    super.initState();

    /// weight = weight * 10
    /// ex) _controller.jumpToItem(50) = 5kg
    _controller =  FixedExtentScrollController(initialItem: (_weight * 10).toInt());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vertical Weight Slider Example"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 200.0,
            alignment: Alignment.center,
            child: Text(
              "$_weight kg",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
            ),
          ),
          VerticalWeightSlider(
            controller: _controller,
            maxWeight: 300,
              isVertical: false,
              config: PointerConfig(
                colors:[
                  Colors.grey[500],
                  Colors.grey[300],
                  Colors.grey[200],
                ],
              ),
            onChanged: (value) {
              setState(() {
                _weight = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
