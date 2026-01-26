import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.languageCode,
    required this.color,
    required this.isSelected,
  });
  final String languageCode;
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.transparent : AppColors.white,
        border: isSelected
            ? Border.all(color: AppColors.white, width: 2.5)
            : null,
      ),
      child: Text(
        languageCode.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? AppColors.white : color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
