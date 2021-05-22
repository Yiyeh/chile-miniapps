import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';

class CargandoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Center(
        child: LoadingBouncingGrid.square(
      borderColor: Colors.grey,
      borderSize: 1.0,
      size: 100.0,
      backgroundColor: Color.fromRGBO(62, 64, 111, 1.0),
      duration: Duration(milliseconds: 1000),
    ));
  }
}
