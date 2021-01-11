import 'package:flutter/material.dart';
import 'package:flutter_second_project/src/pages/alert_page.dart';
import 'package:flutter_second_project/src/pages/animated_container.dart';
import 'package:flutter_second_project/src/pages/avatar_page.dart';
import 'package:flutter_second_project/src/pages/card_pages.dart';
import 'package:flutter_second_project/src/pages/home_page.dart';
import 'package:flutter_second_project/src/pages/inputs_page.dart';
import 'package:flutter_second_project/src/pages/listview_page.dart';
import 'package:flutter_second_project/src/pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "alert": (BuildContext context) => AlertPage(),
    "avatar": (BuildContext context) => AvatarPage(),
    "card": (BuildContext context) => CardPage(),
    "animatedContainer": (BuildContext context) => AnimatedContainerPage(),
    "inputs": (BuildContext context) => InputsPage(),
    "sliders": (BuildContext context) => SliderPage(),
    "list": (BuildContext context) => ListPage(),
  };
}
