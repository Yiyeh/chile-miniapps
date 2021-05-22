import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderApp extends StatelessWidget {
  final String texto;
  final String version;
  final Color color1;
  final Color color2;

  HeaderApp(
      {this.texto = 'Chile MiniApps',
      this.version = '',
      this.color1 = Colors.blue,
      this.color2 = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              gradient: LinearGradient(
                  begin: FractionalOffset(0, 0.5),
                  end: FractionalOffset(0, 1),
                  colors: [color1, color2])),
        ),
        Positioned(
          right: 170,
          bottom: 0,
          child: FaIcon(
            FontAwesomeIcons.search,
            color: Colors.white30,
            size: 80,
          ),
        ),
        Positioned(
            right: 20,
            bottom: 30,
            child: Text(
              texto,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
            )),
        Positioned(
            right: 10,
            top: 0,
            child: Text(
              version,
              style: TextStyle(
                  color: Colors.white, fontSize: 12, fontFamily: "Poppins"),
            )),
      ],
    );
  }
}
