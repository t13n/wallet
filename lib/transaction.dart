import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      color: Color(0xFF31326C),
      child: ListTile(
        leading: Icon(
          Icons.data_usage,
          color: Colors.white,
        ),
        subtitle:
            Text('10/10/2019 14:12:00', style: TextStyle(color: Colors.grey)),
        title: Text('Irfan Usta', style: TextStyle(color: Colors.white)),
        trailing: Text('\$10.0',
            style: TextStyle(color: Colors.amber, fontSize: 18.0)),
      ),
    );
  }
}
