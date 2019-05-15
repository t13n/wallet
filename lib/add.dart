import 'dart:math';
import 'package:flutter/material.dart';
import 'package:offwallet/credit_card_model.dart';
import 'package:offwallet/db_provider.dart';

final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

List colors = [
  {'color': '0xFFFFC312', 'text': 'Sunflower'},
  {'color': '0xFFF79F1F', 'text': 'Radiant Yellow'},
  {'color': '0xFFEE5A24', 'text': 'Puffins Bill'},
  {'color': '0xFFEA2027', 'text': 'Red Pigment'},
  {'color': '0xFFC4E538', 'text': 'Energos'},
  {'color': '0xFFA3CB38', 'text': 'Android Green'},
  {'color': '0xFF009432', 'text': 'Pixelated Grass'},
  {'color': '0xFF006266', 'text': 'Turkish Aqua'},
  {'color': '0xFF12CBC4', 'text': 'Blue Martina'},
  {'color': '0xFF1289A7', 'text': 'Mediterrian'},
  {'color': '0xFF0652DD', 'text': 'Merchant Marine'},
  {'color': '0xFF1B1464', 'text': '20000 Leagues'},
  {'color': '0xFFFDA7DF', 'text': 'Lavender Rose'},
  {'color': '0xFFD980FA', 'text': 'Lavender Tea'},
  {'color': '0xFF9980FA', 'text': 'Forgotten Purple'},
  {'color': '0xFF5758BB', 'text': 'Circumorbital'},
  {'color': '0xFFED4C67', 'text': 'Bara Red'},
  {'color': '0xFFB53471', 'text': 'Very Berry'},
  {'color': '0xFF833471', 'text': 'Hollyhock'},
  {'color': '0xFF6F1E51', 'text': 'Magenta Purple'},
];

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  Map<String, dynamic> _data = {
    'id': Random().nextInt(10000),
    'card_name': '',
    'start_code': '',
    'end_code': '',
    'expire': '',
    'card_color': '',
    'text_color': '',
  };

  String cardColor = '0xFFFFC312';
  String textColor = '0xFFFFFFFF';

  void submit(BuildContext context) {
    _formKey.currentState.save(); // Save our form now.

    DBProvider.db.newCard(CreditCardModel.fromJson(_data));
    Navigator.popAndPushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B2D5B),
        title: Text('Add New Card'),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Card Name'
                ),
                onSaved: (String value) {
                  this._data['card_name'] = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number, // Use email input type for emails.
                maxLength: 4,
                decoration: InputDecoration(
                  labelText: 'First 4 Digit'
                ),
                onSaved: (String value) {
                  this._data['start_code'] = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number, // Use email input type for emails.
                maxLength: 4,
                decoration: InputDecoration(
                  labelText: 'Last 4 Digit'
                ),
                onSaved: (String value) {
                  this._data['end_code'] = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text, // Use email input type for emails.
                maxLength: 5,
                decoration: InputDecoration(
                  labelText: 'Expire Date'
                ),
                onSaved: (String value) {
                  this._data['expire'] = value;
                },
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Card Color'
                ),
                value: cardColor,
                onChanged: (color) {
                  setState(() {
                   cardColor = color; 
                  });
                },
                onSaved: (_) {
                  _data['card_color'] = cardColor;
                },
                items: colors.map<DropdownMenuItem>((color) {
                  return DropdownMenuItem(
                    value: color['color'],
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 50.0,
                          color: Color(int.parse(color['color'])),
                        ),
                        Text(' ${color['text']}'),
                      ],
                    ),
                  );
                }).toList()
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Text Color'
                ),
                value: textColor,
                onChanged: (color) {
                  setState(() {
                   textColor = color; 
                  });
                },
                onSaved: (_) {
                  _data['text_color'] = textColor;
                },
                items: <DropdownMenuItem>[
                  DropdownMenuItem(
                    value: '0xFFFFFFFF',
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 50.0,
                          color: Color(0xFFFFFFFF),
                        ),
                        Text(' White'),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: '0xFF000000',
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          width: 50.0,
                          color: Color(0xFF000000),
                        ),
                        Text(' Black'),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: RaisedButton(
                  child: Text('Save Card'),
                  onPressed: () => submit(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
