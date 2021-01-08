import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ["1", "2", "3", "4", "5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: ListView(
        children: _createShortItem(),
      ),
    );
  }

  List<Widget> _createItem() {
    List<Widget> list = new List<Widget>();
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text("$opt"),
      );
      list..add(tempWidget)..add(Divider());
    }
    return list;
  }

  List<Widget> _createShortItem() {
    return options.map((el) {
      return Column(
        children: [
          ListTile(
            title: Text(el + '!'),
            subtitle: Text("Cualquier cosa"),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
