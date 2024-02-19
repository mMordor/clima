import 'package:flutter/material.dart';

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({super.key,required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            Text("Your Location",textAlign: TextAlign.justify,),
            Icon(Icons.my_location_sharp)
          ],
        ),
      ),
    );
  }
}