import 'package:flutter/material.dart';



class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key, required this.icon, required this.onTap,
  });

  final  IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.blueGrey.shade100,
        radius: 16,
        child: Icon(icon, color: Colors.grey.shade500, size: 18,),

      ),
    );
  }
}