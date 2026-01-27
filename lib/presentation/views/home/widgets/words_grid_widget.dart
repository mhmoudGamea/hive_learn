import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/read/read_data_cubit.dart';
import 'package:hive_learn/presentation/cubits/word_cubits/read/read_data_states.dart';
import 'package:hive_learn/presentation/views/home/widgets/grid_view_widgets.dart';
import 'package:hive_learn/presentation/widgets/animated_dot_loading.dart';

class WordsGridWidget extends StatelessWidget {
  const WordsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit, ReadDataState>(
      builder: (_, state) {
        if (state is ReadDataSuccess) {
          if (state.words.isEmpty) {
            return _emptyAndError(
              path: 'empty_words',
              message: 'Your words is empty, Start adding your first word.',
            );
          }
          return GridViewWidgets(words: state.words);
        } else if (state is ReadDataError) {
          return _emptyAndError(path: 'words_fail', message: state.message);
        }
        // Loading State
        return AnimatedDotLoading(size: 30);
      },
    );
  }

  Widget _emptyAndError({required String path, required String message}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: SvgPicture.asset(
            'assets/images/svg/$path.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        Text(
          message,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
