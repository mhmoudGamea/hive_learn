import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimatedDotLoading extends StatelessWidget {
  const AnimatedDotLoading({super.key, this.size = 20});
  final double size;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: AppColors.secondaryColor,
      size: size,
    );
  }
}
