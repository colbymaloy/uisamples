
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uisamples/neuthumbprint/ui/widgets/background/background.dart';
import 'package:uisamples/neuthumbprint/ui/widgets/thumb/thumb.dart';

class ThumbHome extends StatefulWidget {
  @override
  _ThumbHomeState createState() => _ThumbHomeState();
}

class _ThumbHomeState extends State<ThumbHome> {
  final double blur = 25;

  final double spread = 0;

  final Offset offset = Offset(15, 15);

  final Color innerShadow = Color(0xff8494AD);

  final Color outerShadow = Color(0xff2D2F59).withOpacity(.4);

  final Color innerLight = Colors.white;

  final Color outerLight = Colors.white60;

  final Color baseColor = Color(0xffC1CBD3);

  List<Color> gradient = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gradient = [
      innerLight,
      innerShadow,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Background(),
          ThumbContainer(
            baseColor: baseColor,
            blur: blur,
            spread: spread,
            offset: offset,
            gradient: gradient,
            innerShadow: innerShadow,
            outerShadow: outerShadow,
            innerLight: innerLight,
            outerLight: outerLight,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Container(
                width: 200,
                height: 100,
                color: Colors.white38,
              ),
              onTapDown: (details) {
                setState(() {
                  gradient = gradient.reversed.toList();
                });
              },
              onTapUp: (details) {
                setState(() {
                  gradient = gradient.reversed.toList();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
