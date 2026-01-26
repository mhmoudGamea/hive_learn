import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';
import 'package:hive_learn/presentation/widgets/circle_loading.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    this.isLoading = false,
  });

  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.all(5),
        backgroundColor: AppColors.white,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: isLoading == true ? CircleLoading() : Text(text),
    );
  }
}
