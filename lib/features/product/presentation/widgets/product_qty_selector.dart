// import 'package:flutter/material.dart';
//
// import '../../../../app/app_colors.dart';
//
// class ProductQtySelector extends StatelessWidget {
//   const ProductQtySelector({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//
//           ],
//         ),
//         const Spacer(),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _buildQuantityStepperBtn(icon: Icons.remove, onTap: () {}),
//             const SizedBox(width: 8),
//             Text(
//               '01',
//               style: textTheme.titleMedium!.copyWith(
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(width: 8),
//             _buildQuantityStepperBtn(icon: Icons.add, onTap: () {}),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// Widget _buildQuantityStepperBtn({
//   required IconData icon,
//   required VoidCallback onTap,
// }) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       padding: EdgeInsets.all(2),
//       decoration: BoxDecoration(
//         color: AppColors.themeColor,
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child: Icon(icon, color: Colors.white),
//     ),
//   );
// }
