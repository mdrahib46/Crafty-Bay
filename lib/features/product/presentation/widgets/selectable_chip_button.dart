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
      children: List.generate(items.length, (index) {
        final isSelected = selectedIndex == index;
        final item = items[index];

        return InkWell(
          onTap: () => onSelected(index),
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(

            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.all(4),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item is Color
                  ? (isSelected ? AppColors.themeColor : item)
                  : (isSelected ? AppColors.themeColor : Colors.white),
              border: Border.all(
                color: isSelected ? AppColors.themeColor : Colors.grey.shade300,
                width: item is Color ? (0) : 1
              ),
            ),
            child: _buildChild(item, isSelected),
          ),
        );
      }),
    );
  }

  Widget _buildChild(dynamic item, bool isSelected) {
    if (item is Color) {
      return isSelected
          ? const Icon(Icons.check, color: Colors.white, size: 20)
          : const SizedBox();
    }

    return FittedBox(
      child: Text(
        item.toString(),
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
