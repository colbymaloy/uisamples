import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uisamples/neuthumbprint/ui/widgets/background/background.dart';
import 'package:uisamples/neuthumbprint/ui/widgets/thumb/thumb.dart';

import '../../widgets/led/led.dart';

class ThumbHome extends StatefulWidget {
  @override
  _ThumbHomeState createState() => _ThumbHomeState();
}

class _ThumbHomeState extends State<ThumbHome> {
  final double blur = 25;

  final double spread = 0;

  final Offset offset = Offset(15, 15);

  final Color innerShadow = Color(0xff919BAC);
  final Color innerShadowPressed = Color(0xff798194);

  final Color outerShadow = Color(0xff2D2F59).withOpacity(.4);

  final Color innerLight = Color(0xffeaf0f5);
  // final Color innerLightPressed = Color(0xffffffff);

  final Color outerLight = Colors.white70;

  final Color baseColor = Color(0xffC1CBD3);
  double opacity = 0.0;

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
            child: GestureDetector(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
              onTapDown: (details) {
                setState(() {
                  gradient = gradient.reversed.toList();
                  gradient[0] = innerShadowPressed;
                  opacity = .3;
                });
              },
              onTapUp: (details) {
                setState(() {
                  gradient[0] = innerShadow;
                  gradient = gradient.reversed.toList();
                  opacity = 0.0;
                });
              },
            ),
          ),
          IgnorePointer(
            child: AnimatedOpacity(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 100),
              opacity: opacity,
              child: Image.asset(
                'assets/fingerprint.png',
                
                width: 80,
                height: 80,
              ),
            ),
          )
        ],
      ),
    );
  }
}
