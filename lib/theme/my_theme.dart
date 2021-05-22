import 'package:flutter/material.dart';

LinearGradient gradienteFondo = LinearGradient(
  begin: FractionalOffset(0.0, 0.6),
  end: FractionalOffset(0.0, 1.0),
  colors: [
    //Color.fromRGBO(36, 59, 85, 1),
    //Color.fromRGBO(20, 30, 48, 1),
    Color.fromRGBO(52, 54, 101, 1.0),
    Color.fromRGBO(35, 37, 57, 1.0)
  ],
);

BoxDecoration backgroundDecoration = BoxDecoration(
  gradient: gradienteFondo,
);

Color appBarBackground = Color.fromRGBO(52, 54, 101, 1.0);
