import 'package:flutter/material.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late WeightSliderController _controller;
  double _weight = 30.0;

  @override
  void initState() {
    super.initState();
    _controller = WeightSliderController(initialWeight: _weight, minWeight: 0, interval: 0.1);
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
            height: 200,
            alignment: Alignment.center,
            child: Text(
              "${_weight.toStringAsFixed(1)} kg",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
          ),
          VerticalWeightSlider(
            controller: _controller,
            decoration: const PointerDecoration(
              width: 130,
              height: 3,
              largeColor: Color(0xFF898989),
              mediumColor: Color(0xFFC5C5C5),
              smallColor: Color(0xFFF0F0F0),
              gap: 30,
            ),
            onChanged: (double value) {
              setState(() {
                _weight = value;
              });
            },
            indicator: Container(
              height: 3,
              width: 200,
              alignment: Alignment.centerLeft,
              color: Colors.red[300],
            ),
          ),
        ],
      ),
    );
  }
}
