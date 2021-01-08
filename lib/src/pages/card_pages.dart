import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardPage"),
      ),
      body: ListView(
          children: <Widget>[_firstTypeCard(), _secondTypeCard()],
          padding: EdgeInsets.all(20.0)),
    );
  }

  Widget _firstTypeCard() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Nuevo"),
            subtitle: Text("Buenas  menorsito"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(onPressed: null, child: Text("Cancelar")),
              FlatButton(onPressed: null, child: Text("OK"))
            ],
          )
        ],
      ),
    );
  }

  Widget _secondTypeCard() {
    final card = Container(
      child: Column(
        children: <Widget>[
          //FadeInImage(placeholder: "null", image: null),
          FadeInImage(
            image: NetworkImage(
                "https://i.blogs.es/67ac5a/wallpaper-dinamicos-macos/1366_521.jpg"),
            placeholder: AssetImage("assets/jar-loading (2).gif"),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text("Hola tests"),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
