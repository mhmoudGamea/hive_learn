import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_learn/core/styles/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondaryColor,
        ),
        child: SvgPicture.asset(
          'assets/images/svg/filter.svg',
          fit: BoxFit.scaleDown,
          color: AppColors.white,
        ),
      ),
    );
  }
}
