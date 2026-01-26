import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';

class CircleLoading extends StatelessWidget {
  final bool isLoading;
  final Color color;
  final double size;
  final double strokeWidth;
  final Duration duration;

  const CircleLoading({
    super.key,
    this.isLoading = true,
    this.color = AppColors.secondaryColor,
    this.size = 20,
    this.strokeWidth = 1.5,
    this.duration = const Duration(milliseconds: 250),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: isLoading
          ? SizedBox(
              key: const ValueKey('loading'),
              width: size,
              height: size,
              child: CircularProgressIndicator(
                strokeWidth: strokeWidth,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            )
          : const SizedBox(key: ValueKey('empty')),
    );
  }
}
