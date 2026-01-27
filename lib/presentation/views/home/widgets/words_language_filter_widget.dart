import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_learn/core/utils/enums.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/read/read_data_cubit.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/read/read_data_states.dart';
import 'package:hive_learn/presentation/widgets/filter_button.dart';
import 'package:hive_learn/presentation/views/home/widgets/word_filter_dialog.dart';

class WordsLanguageFilterWidget extends StatelessWidget {
  const WordsLanguageFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final readDataCubit = ReadDataCubit.get(context);
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _mapLangFilterEnumToString(readDataCubit.languageFilter),
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            FilterButton(
              onTap: () {
                showFilterDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  String _mapLangFilterEnumToString(LanguageFilter filter) {
    switch (filter) {
      case LanguageFilter.arabic:
        return 'Arabic Words';
      case LanguageFilter.english:
        return 'English Words';
      default:
        return 'All Words';
    }
  }

  void showFilterDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => WordFilterDialog());
  }
}
