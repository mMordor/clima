import 'package:clima/constants/constants.dart';
import 'package:flutter/material.dart';

class LocationTitle extends StatelessWidget {
  const LocationTitle({super.key,required this.icon,required this.location});
  final String location;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Text(location,style: KLocationTitle),
        )
      ],
    );
  }
}