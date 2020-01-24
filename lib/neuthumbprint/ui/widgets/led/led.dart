import 'package:flutter/material.dart';

class LedIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Color(0xffC1CBD3),
          borderRadius: BorderRadius.circular(92),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff798194), Color(0xffeaf0f5)])),
    );
  }
}
