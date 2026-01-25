import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isSelected});
  final int color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(color),
        border: isSelected
            ? Border.all(color: AppColors.white, width: 2.5)
            : null,
      ),
      child: isSelected
          ? const Icon(Icons.check_rounded, size: 22, color: AppColors.white)
          : null,
    );
  }
}
