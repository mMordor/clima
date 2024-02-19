import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key,required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(24)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      )
    );
  }
}