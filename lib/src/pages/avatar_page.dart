import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar"),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://assets.change.org/photos/4/ej/pg/CaEjpgBuRZepPmA-800x450-noPad.jpg?1554228744"),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 10.0),
              child:
                  CircleAvatar(child: Text("SL"), backgroundColor: Colors.grey))
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              "https://assets.change.org/photos/4/ej/pg/CaEjpgBuRZepPmA-800x450-noPad.jpg?1554228744"),
          placeholder: AssetImage("assets/jar-loading (2).gif"),
          fadeInDuration: Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
