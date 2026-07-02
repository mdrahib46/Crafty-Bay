import 'package:craftybay/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChange});
  final List<String> colors;
  final Function(String) onChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.colors.map((color) {
        return GestureDetector(
          onTap: () {
            _selectedColor = color;
            widget.onChange(color);
            setState(() {});
          },
          child: Container(
            padding: .symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
              color: _selectedColor == color ? AppColors.themeColor : null,
            ),
            child: Text(
              color,
              style: TextStyle(
                color: _selectedColor == color ? Colors.white : null,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
