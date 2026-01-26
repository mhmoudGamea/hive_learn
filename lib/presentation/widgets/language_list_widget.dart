import 'package:flutter/material.dart';
import 'package:hive_learn/presentation/widgets/language_item.dart';

class LanguageListWidget extends StatefulWidget {
  const LanguageListWidget({
    super.key,
    required this.color,
    required this.onLanguageSelected,
  });

  final Color color;
  final ValueChanged<String> onLanguageSelected;

  @override
  State<LanguageListWidget> createState() => _LanguageListWidgetState();
}

class _LanguageListWidgetState extends State<LanguageListWidget> {
  final List<String> _languages = const ["En", "Ar"];

  int _selectedLanguageIndex = 0;

  bool isSelected(index) => _selectedLanguageIndex == index;

  void onSelectedLanguage(int index) {
    setState(() {
      _selectedLanguageIndex = index;
    });
    widget.onLanguageSelected(_languages[index]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _languages.length,
        separatorBuilder: (_, index) => SizedBox(width: 5),
        itemBuilder: (_, index) => InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            onSelectedLanguage(index);
          },
          child: LanguageItem(
            languageCode: _languages[index],
            color: widget.color,
            isSelected: isSelected(index),
          ),
        ),
      ),
    );
  }
}
