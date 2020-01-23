import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,end: Alignment.bottomRight,
            colors: [
        Color(0xffE9ECF1),
        Color(0xffA5B0BC),
      ])),
    );
  }
}
