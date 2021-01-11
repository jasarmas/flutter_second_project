import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sliders"),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _createSlider(),
              Expanded(child: _createImage()),
            ],
          ),
        ));
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la imagen",
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: (value) {
        setState(() {
          _sliderValue = value;
        });
      },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/afa52b62887ed55475d095a8e18c5610b2444d28beb5b6ee2f322e6613374bad._V_SX1700_.jpg"),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
