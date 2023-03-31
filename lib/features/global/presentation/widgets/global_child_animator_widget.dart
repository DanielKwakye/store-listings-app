import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GlobalChildAnimatorWidget extends StatelessWidget {
  final Widget child;
  final int duration;
  const GlobalChildAnimatorWidget({
    required this.child,
    this.duration = 800,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: SlideAnimation(
        duration: Duration(milliseconds: duration),
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: child,
        ),
      ),


    );
  }
}
