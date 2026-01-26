import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';

class WordTextFormWidget extends StatefulWidget {
  const WordTextFormWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.formKey,
    required this.isArabic,
  });

  final TextEditingController controller;
  final String label;
  final GlobalKey<FormState> formKey;
  final bool isArabic;

  @override
  State<WordTextFormWidget> createState() => _WordTextFormWidgetState();
}

class _WordTextFormWidgetState extends State<WordTextFormWidget> {
  String? _validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is required';
    }

    final trimmedValue = value.trim();

    if (widget.isArabic) {
      final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
      if (!arabicRegex.hasMatch(trimmedValue)) {
        return 'Please enter Arabic letters only';
      }
    } else {
      final englishRegex = RegExp(r'^[a-zA-Z\s]+$');
      if (!englishRegex.hasMatch(trimmedValue)) {
        return 'Please enter English letters only';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        style: const TextStyle(fontSize: 15, color: AppColors.white),
        cursorColor: AppColors.white,
        controller: widget.controller,
        validator: _validator,
        autofocus: true,
        minLines: 1,
        maxLines: 2,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(fontSize: 14, color: AppColors.white),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.white, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.white, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.white, width: 2),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.red, width: 2),
          ),

          errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
        ),
      ),
    );
  }
}
