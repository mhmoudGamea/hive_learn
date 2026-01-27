import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';
import 'package:hive_learn/core/utils/enums.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/read/read_data_cubit.dart';

import '../../../../data/models/filter_button_model.dart';
import 'custom_buttons_list.dart';

class WordFilterDialog extends StatelessWidget {
  const WordFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final readCubit = ReadDataCubit.get(context);
    return Dialog(
      backgroundColor: AppColors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            _showLabelText('Language'),
            CustomButtonsList(
              buttons: [
                FilterButtonModel(
                  title: "Arabic",
                  isSelected: readCubit.languageFilter == LanguageFilter.arabic,
                  onPressed: () {
                    readCubit.updateLanguageFilter(LanguageFilter.arabic);
                  },
                ),
                FilterButtonModel(
                  title: "English",
                  isSelected:
                      readCubit.languageFilter == LanguageFilter.english,
                  onPressed: () {
                    readCubit.updateLanguageFilter(LanguageFilter.english);
                  },
                ),
                FilterButtonModel(
                  title: "All",
                  isSelected: readCubit.languageFilter == LanguageFilter.all,
                  onPressed: () {
                    readCubit.updateLanguageFilter(LanguageFilter.all);
                  },
                ),
              ],
            ),

            _showLabelText('Sorted By'),
            CustomButtonsList(
              buttons: [
                FilterButtonModel(
                  title: "Time",
                  isSelected: readCubit.sortedBy == SortedBy.time,
                  onPressed: () {
                    readCubit.updateSortedBy(SortedBy.time);
                  },
                ),
                FilterButtonModel(
                  title: "Word Length",
                  isSelected: readCubit.sortedBy == SortedBy.wordLength,
                  onPressed: () {
                    readCubit.updateSortedBy(SortedBy.wordLength);
                  },
                ),
              ],
            ),

            _showLabelText('Sorting Type'),
            CustomButtonsList(
              buttons: [
                FilterButtonModel(
                  title: "Ascending",
                  isSelected: readCubit.sortingOrder == SortingOrder.ascending,
                  onPressed: () {
                    readCubit.updateSortingOrder(SortingOrder.ascending);
                  },
                ),
                FilterButtonModel(
                  title: "Descending",
                  isSelected: readCubit.sortingOrder == SortingOrder.descending,
                  onPressed: () {
                    readCubit.updateSortingOrder(SortingOrder.descending);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _showLabelText(String label) {
    return Text(
      label,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
