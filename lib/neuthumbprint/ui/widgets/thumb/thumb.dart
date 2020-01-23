import 'package:flutter/material.dart';

class ThumbContainer extends StatelessWidget {
  final double blur;

  final double spread;

  final Offset offset;

  final Color innerShadow;

  final Color outerShadow;

  final Color innerLight;

  final Color outerLight;

  final Color baseColor;

  final List<Color> gradient;

  const ThumbContainer({
    Key key,
    this.blur,
    this.spread,
    this.offset,
    this.innerShadow,
    this.outerShadow,
    this.innerLight,
    this.outerLight,
    this.baseColor,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool condition = (gradient[1] == innerShadow);
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(110),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
          boxShadow: [
            if (condition)
              BoxShadow(
                  color: outerLight,
                  offset: -offset,
                  blurRadius: blur,
                  spreadRadius: spread),
            BoxShadow(
                color: condition ? outerLight.withOpacity(.1):outerLight.withOpacity(.5),
                offset: -offset - Offset(15, 15),
                blurRadius: blur * 1.2,
                spreadRadius: spread),
            if (condition)
              BoxShadow(
                  color: outerShadow,
                  offset: offset,
                  blurRadius: blur,
                  spreadRadius: spread),
            BoxShadow(
                color: outerShadow.withOpacity(.1),
                offset: offset + Offset(15, 15),
                blurRadius: blur * 1.2,
                spreadRadius: spread),
          ]),
    );
  }
}

enum FaceType { Normal, Concave, Convex }
