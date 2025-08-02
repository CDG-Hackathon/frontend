import 'package:flutter/material.dart';
import 'dart:math';

class DotLoadingAnimation extends StatefulWidget {
  final double dotSize;
  final Color dotColor;

  const DotLoadingAnimation({
    Key? key,
    this.dotSize = 12,
    this.dotColor = Colors.blue,
  }) : super(key: key);

  @override
  State<DotLoadingAnimation> createState() => _DotLoadingAnimationState();
}

class _DotLoadingAnimationState extends State<DotLoadingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _opacityAnimations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();

    _opacityAnimations = List.generate(3, (index) {
      final start = index * 0.3;
      final end = min(1.0, start + 0.6); 

      return Tween<double>(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    return FadeTransition(
      opacity: _opacityAnimations[index],
      child: Container(
        width: widget.dotSize,
        height: widget.dotSize,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: widget.dotColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, _buildDot),
    );
  }
}
