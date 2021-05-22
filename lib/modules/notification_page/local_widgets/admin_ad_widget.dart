import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/modules/notification_page/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class AdminAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (_) {
          return FadeInLeft(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                        child: Text('¿Te gusta Chile MiniApps? 🤭­',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: 5,
                      width: double.infinity,
                    ),
                    Center(
                        child: Text(
                            'Si te gusta la aplicación considera compartirla y puntuarnos en la playstore, ¡Muchas Gracias!.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white))),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                _.launchURL('https://bit.ly/ChileMiniApps');
                              },
                              child: CircleAvatar(
                                  backgroundColor: Colors.white12,
                                  radius: 20,
                                  child: FaIcon(
                                    FontAwesomeIcons.solidStar,
                                    color: Colors.yellow,
                                  ))),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              final text =
                                  '¡Mira esta App! mucha información de interes publico en una sola App ( Sismologí­a, Farmacias de turno, Feriados, Valores de Divisas, Agenda de números nacionales importantes, conoce tu saldo Bip!, ¡entre muchas cosas mas! )\n"Chile Miniapps (Totalmente Gratuito)"\nhttps://bit.ly/ChileMiniApps';
                              final description = text;
                              Share.share(text, subject: description);
                            },
                            child: Center(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white12,
                                    radius: 20,
                                    child: FaIcon(
                                      FontAwesomeIcons.shareAlt,
                                      color: Colors.lightBlue,
                                      size: 18,
                                    ))),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/info_page');
                            },
                            child: Center(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white12,
                                    radius: 20,
                                    child: FaIcon(
                                      FontAwesomeIcons.infoCircle,
                                      color: Colors.green,
                                      size: 18,
                                    ))),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
