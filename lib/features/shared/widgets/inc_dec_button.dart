import 'package:flutter/material.dart';

import '../../../app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({
    super.key,
    required this.maxCount,
    required this.minCount,
    required this.initialValue,
    required this.onChange,
  });

  final int maxCount, minCount, initialValue;

  final Function(int) onChange;

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  late int _counter = 0;

  @override
  void initState() {
    super.initState();
    _counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconButton(
          icon: Icons.remove,
          onTap: () {
            if (_counter > widget.initialValue) {
              _counter--;
              widget.onChange(_counter);
              setState(() {});
            }
          },
        ),
        
        Text('$_counter', style: TextStyle(fontSize: 24, ),),

        _iconButton(
          icon: Icons.add,
          onTap: () {
            if (_counter < widget.initialValue) {
              _counter++;
              widget.onChange(_counter);
              setState(() {});
            }
          },
        ),
      ],
    );
  }

  Widget _iconButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: Colors.white, size: 20,),
      ),
    );
  }
}
