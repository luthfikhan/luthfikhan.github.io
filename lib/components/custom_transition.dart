import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomTransition extends AnimatedWidget {
  const CustomTransition({
    @required Animation<double> sizeFactor,
    this.child,
  }) : super(listenable: sizeFactor);

  Animation<double> get sizeFactor => listenable as Animation<double>;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1, -1.0),
      widthFactor: math.max(sizeFactor.value, 0),
      child: child,
    );
  }
}
