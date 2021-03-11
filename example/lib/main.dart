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
  double weight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vertical Weight Slider Example"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200.0,
              alignment: Alignment.center,
              child: Text(
                "$weight kg",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
              ),
            ),
            VerticalWeightSlider(
              maximumWeight: 200,
              initialWeight: 50,
              gradationColor: [
                Colors.grey[500],
                Colors.grey[300],
                Colors.grey[200]
              ],
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
