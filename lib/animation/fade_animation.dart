import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({super.key, required this.delay, required this.child});

  final tween = MovieTween()
    ..tween(
      'opacity',
      Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 500),
    )
    ..tween('translatex', Tween(begin: 120.0, end: 0.0),
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (context, animation, child) => Opacity(
        opacity: animation.get('opacity'),
        child: Transform.translate(
          offset: Offset(animation.get('translatex'), 0),
          child: child,
        ),
      ),
    );
  }
}