import 'package:flutter/material.dart';

class CustomeSearchBar extends StatelessWidget {
  const CustomeSearchBar({super.key,required this.onSubmitted});
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        fillColor: Colors.white12,
        filled: true,
        prefixIcon: const Icon(Icons.search),
        hintText: 'Saerch Country...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}