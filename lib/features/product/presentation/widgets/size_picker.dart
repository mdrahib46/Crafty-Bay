import 'package:flutter/material.dart';

import 'package:craftybay/app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.itemSize, required this.onChange});
  final List<String> itemSize;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.itemSize.map((size) {
        return GestureDetector(
          onTap: () {
            _selectedColor = size;
            widget.onChange(size);
            setState(() {});
          },
          child: Container(
            height: 36,
            width: 36,
            padding: .all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
              color: _selectedColor == size ? AppColors.themeColor : null,
            ),
            child: FittedBox(
              child: Text(
                size,
                style: TextStyle(
                  color: _selectedColor == size ? Colors.white : null,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
