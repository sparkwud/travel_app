import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FrostedWidget extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  Color? color = Colors.grey.shade200.withOpacity(0.1);
  final Widget child;
  final double? opacity;
  FrostedWidget({
    super.key,
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomLeft,
    required this.child,
    this.color,
    this.opacity = .5,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Container(
          width: double.infinity,
          color: color,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
