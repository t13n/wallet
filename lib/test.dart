import 'package:flutter/material.dart';

class TestBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size(double.infinity, 50);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF66BB6A),
        boxShadow: [
          new BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Center(
        child: Text('Test Bar'),
      ),
    );
  }
}
