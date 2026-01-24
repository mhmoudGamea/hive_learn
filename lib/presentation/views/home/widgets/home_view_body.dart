import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/construction_13541160 1.svg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.contain,
    );
  }
}
