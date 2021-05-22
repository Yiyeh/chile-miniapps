import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AppButtom extends StatelessWidget {
  final String texto;
  final String ruta;
  final IconData icono;
  final Color color1;
  final Color color2;

  AppButtom({
    this.texto = 'Soy un botón',
    this.ruta = '/',
    this.icono = FontAwesomeIcons.phone,
    this.color1 = Colors.cyan,
    this.color2 = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white;

    return FadeInLeft(
      from: 80,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ruta);
        },
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.1, 0),
                        spreadRadius: 1,
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(3),
                  //color: Colors.redAccent,
                  gradient: LinearGradient(
                      begin: FractionalOffset(1, 0),
                      end: FractionalOffset(0.5, 0),
                      colors: [color2, color1])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  FaIcon(
                    icono,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                    texto,
                    style: TextStyle(color: textColor, fontSize: 15),
                  ))),
                  SizedBox(
                    width: 20,
                  ),
                  FaIcon(
                    FontAwesomeIcons.chevronRight,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 50,
              bottom: 20,
              child: FaIcon(
                icono,
                color: Colors.white10,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigAppButtom extends StatelessWidget {
  final String texto;
  final String ruta;
  final IconData icono;
  final Color color1;
  final Color color2;
  final BannerAd controller;

  BigAppButtom({
    this.texto = 'Soy un botón',
    this.ruta = '/',
    this.icono = FontAwesomeIcons.phone,
    this.color1 = Colors.cyan,
    this.color2 = Colors.blue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white;

    return FadeInLeft(
      from: 20,
      child: GestureDetector(
        onTap: () {
          controller.dispose();
          Navigator.pushNamed(context, ruta);
        },
        child: ClipRRect(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.1, 0),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ],
                    borderRadius: BorderRadius.circular(4),
                    //color: Colors.redAccent,
                    gradient: LinearGradient(
                        begin: FractionalOffset(1, 0),
                        end: FractionalOffset(0.5, 0),
                        colors: [color2, color1])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    Expanded(
                        child: FadeInDown(
                      from: 0,
                      child: FaIcon(
                        icono,
                        color: Colors.white,
                        size: 35,
                      ),
                    )),
                    //SizedBox(width: 20, height: 5,),
                    Expanded(
                        child: Center(
                            child: Text(
                      texto,
                      style: TextStyle(color: textColor, fontSize: 13),
                    ))),
                    SizedBox(
                      width: 20,
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 15,
                bottom: 15,
                child: FaIcon(
                  icono,
                  color: Colors.white10,
                  size: 60,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
