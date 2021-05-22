import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ConnectionErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeInDown(child: FaIcon(FontAwesomeIcons.wifi, color: Colors.white, size: 110,)),
            SizedBox(height: 20,),
            FadeInLeft(child: Center(child: Text('Compruebe su conexión a Internet.', style: TextStyle(color: Colors.white, fontSize: 30), textAlign: TextAlign.center,),)),
            SizedBox(height: 10,),
            FadeInLeft(child: Center(child: Text('Si el problema persiste, el servicio puede estar temporalmente fuera de línea, inténtelo más tarde.', style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center), )),
          ],
        ),
      ),
    );
  }
}