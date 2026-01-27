import 'package:flutter/material.dart';

class FilterButtonModel {
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  FilterButtonModel({
    required this.title,
    required this.onPressed,
    this.isSelected = false,
  });

  FilterButtonModel copyWith({bool? isSelected}) {
    return FilterButtonModel(
      title: title,
      onPressed: onPressed,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
