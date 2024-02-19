import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitSpinningLines(
                color: Colors.white
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Fetching Data..."),
              )
            ],
          ),
        ),
      );
  }
}