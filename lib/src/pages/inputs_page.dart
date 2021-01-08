import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = "";
  String _email = "";
  String _password = "";
  String _date = "";
  String _selectedOption = "Volar";

  TextEditingController _inputFieldDateController = new TextEditingController();

  List<String> _powers = ["Volar", "Rayozz X", "Super Aliento", "Super fuerza"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropwdown(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text("Letras ${_name.length}"),
          hintText: "Nombre de la persona",
          labelText: "Nombre",
          helperText: "Solo es el nombre",
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text("Nombre es: $_name"),
      subtitle: Text("Email: $_email"),
      trailing: Text(_selectedOption),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Email",
          labelText: "Correo electronico",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Password",
          labelText: "Password",
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() {
        _password = value;
      }),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Fecha de nacimiento",
          labelText: "Fecha de nacimiento",
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Future _selectDate(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2022),
      locale: Locale("es", "ES"),
    );

    if (selectedDate != null) {
      setState(() {
        _date = selectedDate.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach((element) {
      list.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return list;
  }

  Widget _createDropwdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
              value: _selectedOption,
              items: getDropdownOptions(),
              onChanged: (opt) => setState(() {
                    _selectedOption = opt;
                  })),
        ),
      ],
    );
  }
}
