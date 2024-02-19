import 'package:clima/constants/constants.dart';
import 'package:flutter/material.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({super.key,required this.descr,required this.temp});
  final String temp;
  final String descr;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: Column(
        children: [
          Text(temp,style: KTempdetailstemp ),
          Text(descr,style: KTempdetailsdescr)
        ]
      ),
    );
  }
}