import 'package:flutter/material.dart';
import 'package:hive_learn/core/styles/app_colors.dart';

import '../../../../data/models/filter_button_model.dart';

class CustomButtonsList extends StatefulWidget {
  const CustomButtonsList({super.key, required this.buttons});
  final List<FilterButtonModel> buttons;

  @override
  State<CustomButtonsList> createState() => _CustomButtonsListState();
}

class _CustomButtonsListState extends State<CustomButtonsList> {
  late List<FilterButtonModel> _buttons;

  @override
  void initState() {
    super.initState();
    _buttons = widget.buttons;
  }

  void _onFilterButtonPressed(int index) {
    setState(() {
      _buttons = List.generate(
        _buttons.length,
        (i) => _buttons[i].copyWith(isSelected: index == i),
      );
    });
    _buttons[index].onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _buttons.length,
        itemBuilder: (_, index) {
          final isSelected = _buttons[index].isSelected;
          return FilledButton(
            onPressed: () {
              _onFilterButtonPressed(index);
            },

            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: isSelected
                      ? AppColors.secondaryColor
                      : AppColors.black,
                  width: 1.5,
                ),
              ),
              backgroundColor: isSelected
                  ? AppColors.secondaryColor
                  : AppColors.white,
              foregroundColor: isSelected ? AppColors.white : AppColors.black,
            ),
            child: Text(
              _buttons[index].title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
            ),
          );
        },
        separatorBuilder: (_, index) => SizedBox(width: 8),
      ),
    );
  }
}
