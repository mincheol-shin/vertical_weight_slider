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
  late WeightSliderController _controller;
  double _weight = 50.5;
  int _minWeight = 10;

  @override
  void initState() {
    super.initState();
    _controller =
        WeightSliderController(initialWeight: _weight, minWeight: _minWeight, isDoubleInterval: false);
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
