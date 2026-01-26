import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/write/write_data_cubit.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/write/write_data_states.dart';
import 'package:hive_learn/presentation/widgets/button_widget.dart';
import 'package:hive_learn/presentation/widgets/language_list_widget.dart';
import 'package:hive_learn/presentation/widgets/word_text_form_widget.dart';

import '../../../widgets/colors_list_widget.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  Color _selectedColor = Color(0xFF799EFF);
  String _selectedLanguage = "En";
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteDataCubit, WriteDataState>(
      builder: (_, state) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            color: _selectedColor,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                LanguageListWidget(
                  color: _selectedColor,
                  onLanguageSelected: (language) {
                    setState(() {
                      _selectedLanguage = language;
                    });
                  },
                ),
                ColorsListWidget(
                  onColorSelected: (color) {
                    setState(() {
                      _selectedColor = color;
                    });
                  },
                ),

                WordTextFormWidget(
                  controller: controller,
                  label: 'New Word',
                  formKey: formKey,
                  isArabic: _selectedLanguage == 'Ar',
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: ButtonWidget(
                    text: 'Done',
                    textColor: _selectedColor,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        log(
                          'New Word: ${controller.text}, Language: $_selectedLanguage, Color: ${_selectedColor}',
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
