import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sliders"),
        ),
        body: Container(
          child: Text("Slider page"),
        ));
  }
}
