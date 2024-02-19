import 'package:clima/constants/constants.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key,required this.title,required this.description});
  final String title ;
  final String description ;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom:12.0),
          child: Icon(Icons.error,size:200),
        ),
        Text(title, style: KTempdetailsdescr,textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description, style :KWeatherdetailtile,textAlign: TextAlign.center),
        )
      ],
    );
  }
}