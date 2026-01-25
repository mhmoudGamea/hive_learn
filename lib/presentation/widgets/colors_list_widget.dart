import 'package:flutter/material.dart';
import 'package:hive_learn/presentation/widgets/color_item.dart';

class ColorsListWidget extends StatefulWidget {
  const ColorsListWidget({super.key, required this.onColorSelected});

  final ValueChanged<Color> onColorSelected;

  @override
  State<ColorsListWidget> createState() => _ColorsListWidgetState();
}

class _ColorsListWidgetState extends State<ColorsListWidget> {
  final List<int> _colorsCode = const [
    0xFF799EFF,
    0xFFFF894F,
    0xFF0F828C,
    0xFFEAA64D,
    0xFFFFD700,
    0xFF00CAFF,
    0xFF94B4C1,
    0xFFAFDDFF,
    0xFFC68EFD,
    0xFFAEEA94,
    0xFF6EC207,
  ];
  int _selectedColorIndex = 0;
  bool isSelected(int index) => _selectedColorIndex == index;

  void onSelectedColor(int index) {
    setState(() {
      _selectedColorIndex = index;
    });
    widget.onColorSelected(Color(_colorsCode[index]));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _colorsCode.length,
        itemBuilder: (_, index) => InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => onSelectedColor(index),
          child: ColorItem(
            color: _colorsCode[index],
            isSelected: isSelected(index),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 5),
      ),
    );
  }
}
