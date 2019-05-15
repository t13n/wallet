import 'package:flutter/material.dart';
import 'package:offwallet/home.dart';
import 'package:offwallet/add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (BuildContext context) => Home(),
        '/add': (BuildContext context) => Add(),
      },
    );
  }
}
