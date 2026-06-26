import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class SelectableButton<T> extends StatelessWidget {
  const SelectableButton({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<T> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(
        items.length,
            (index) {
          final isSelected = selectedIndex == index;
          final item = items[index];

          return InkWell(
            onTap: () => onSelected(index),
            borderRadius: BorderRadius.circular(20),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: item is String
                  ? const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              )
                  : EdgeInsets.zero,
              width: item is Color ? 34 : null,
              height: item is Color ? 34 : null,
              decoration: BoxDecoration(
                shape: item is Color
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                borderRadius: item is String
                    ? BorderRadius.circular(20)
                    : null,
                color: item is Color
                    ? (isSelected
                    ? AppColors.themeColor
                    : item)
                    : (isSelected
                    ? AppColors.themeColor
                    : Colors.white),
                border: Border.all(
                  color: isSelected
                      ? AppColors.themeColor
                      : Colors.grey.shade300,
                ),
              ),
              child: _buildChild(item, isSelected),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChild(dynamic item, bool isSelected) {
    if (item is Color) {
      return isSelected
          ? const Icon(
        Icons.check,
        color: Colors.white,
        size: 20,
      )
          : const SizedBox();
    }

    return Text(
      item.toString(),
      style: TextStyle(
        color: isSelected
            ? Colors.white
            : Colors.grey.shade700,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}