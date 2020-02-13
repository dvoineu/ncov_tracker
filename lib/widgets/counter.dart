import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnimatedCounter extends ImplicitlyAnimatedWidget {
  final int number;
  final double fontSize;
  final Color color;

  AnimatedCounter({
    Key key,
    @required this.number,
    this.color,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.linear,
    this.fontSize
  }) : super(
          key: key,
          duration: duration,
          curve: curve,
        );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedCounterState();
}

class _AnimatedCounterState extends AnimatedWidgetBaseState<AnimatedCounter> {
  IntTween _counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.color,
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 8.0,
      ),
      child: Text(
        NumberFormat.decimalPattern().format( _counter.evaluate(animation)).toString(),
        style: TextStyle(
          fontSize: widget.fontSize,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    _counter = visitor(
      _counter,
      widget.number,
      (dynamic value) => IntTween(begin: value),
    );
  }
}
