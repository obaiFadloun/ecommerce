import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircleProgressStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SpinKitCircle(
          size: 140,
          itemBuilder: (context, index){
            final colors =[Colors.amber, Colors.blue,];
            final color = colors[index % colors.length];
            return DecoratedBox(decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color
            ),
            );
          },
        ),
    );
  }
}
