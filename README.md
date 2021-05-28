# Vertical Weight Slider

This package provides easy-to-use and scrollable vertical weight slider. 

Compatible with Android & iOS & Web. :heart_eyes:

[![pub](https://img.shields.io/pub/v/vertical_weight_slider)](https://pub.dev/packages/vertical_weight_slider)


<br>

# Showcase

<img src = "https://user-images.githubusercontent.com/55150540/104460060-f3756080-55f0-11eb-9105-e398b87646b1.gif" width = 200>


<br> 

# Getting Started

In the pubspec.yaml of your flutter project, add the following dependency:

```yaml
dependencies:
  vertical_weight_slider : "^lastest_version"
```

<br>

# Usage
Need to include the import the package to the dart file where it will be used, refer the below command
```dart
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
```

<br>

# Complete example
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
        WeightSliderController(initialWeight: _weight, minWeight: _minWeight);
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
            maxWeight: 1000,
            config: PointerConfig(
              colors: [
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


```
<br>

# License
```
Copyright 2020, the Flutter project authors. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```
