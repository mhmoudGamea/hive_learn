import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/write/write_data_cubit.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/write/write_data_states.dart';

import '../../../widgets/colors_list_widget.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});

  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  Color _selectedColor = Color(0xFF799EFF);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteDataCubit, WriteDataState>(
      builder: (_, state) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: _selectedColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ColorsListWidget(
                onColorSelected: (color) {
                  _selectedColor = color;
                  setState(() {});
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
