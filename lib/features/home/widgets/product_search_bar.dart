import 'package:flutter/material.dart';


class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({super.key});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.grey.withAlpha(50),
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide.none,  borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none,  borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none,  borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.search, color: Colors.grey,),
        hintStyle: TextStyle(color: Colors.grey),
        hintText: "Search",

        
      ),
    );
  }
}
