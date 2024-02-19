import 'package:clima/constants/constants.dart';
import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key,required this.tile,required this.valu,required this.iswind});
  final String tile;
  final String valu;
  final bool iswind ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(valu,style: KWeatherdetailvalu),
              Text(iswind == true ? 'km/h' :'',style: KWeatherdetailtile)
            ],
          ),
          Text(tile,style: KWeatherdetailtile)
        ]
      ),
    );
  }
}