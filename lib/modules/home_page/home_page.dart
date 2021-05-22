import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:chile_miniapps/modules/home_page/local_widgets/header_widget.dart';
import 'package:chile_miniapps/modules/home_page/home_controller.dart';
import 'package:chile_miniapps/modules/home_page/local_widgets/app_buttom.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      initState: (_) {},
      builder: (_) {
        _.myBanner.load();
        
       
        final AdWidget adWidget = AdWidget(ad: _.myBanner);


        final Container adContainer = Container(
          alignment: Alignment.center,
          child: adWidget,
          width: _.myBanner.size.width.toDouble(),
          height: _.myBanner.size.height.toDouble(),
        );

        return Scaffold(
          body: SafeArea(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: backgroundDecoration,
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      FadeInLeft(
                        child: HeaderApp(
                          version: 'Version: $version',
                          color1: Color(0xFF01579B).withOpacity(0),
                          color2: Color(0xFF0277BD).withOpacity(0),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Table(
                        children: [
                          TableRow(children: [
                            BigAppButtom(
                              icono: FontAwesomeIcons.comment,
                              texto: 'Notificaciones',
                              ruta: '/notificacion',
                              color1: Color(0xFFADD100).withOpacity(0.5),
                              color2: Color(0xFF7B920A).withOpacity(0.5),
                              controller: _.myBanner,
                            ),
                            BigAppButtom(
                              icono: FontAwesomeIcons.phone,
                              texto: 'Agenda',
                              ruta: '/agenda',
                              color1: Color(0xFF0277BD).withOpacity(0.7),
                              color2: Color(0xFF01579B).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                          ]),
                          TableRow(children: [
                            BigAppButtom(
                              icono: FontAwesomeIcons.sun,
                              texto: 'Clima',
                              ruta: '/clima',
                              color1: Color(0xFF00796B).withOpacity(0.7),
                              color2: Color(0xFF00897B).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                            BigAppButtom(
                              icono: FontAwesomeIcons.pills,
                              texto: 'Farmacias',
                              ruta: '/farmacia',
                              color1: Color(0xFFBF360C).withOpacity(0.7),
                              color2: Color(0xFFD84315).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                          ]),
                          TableRow(children: [
                            BigAppButtom(
                              icono: FontAwesomeIcons.glassCheers,
                              texto: 'Feriados',
                              ruta: '/feriado',
                              color1: Color(0xFFAD1457).withOpacity(0.7),
                              color2: Color(0xFFC2185B).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                            BigAppButtom(
                              icono: FontAwesomeIcons.globeAmericas,
                              texto: 'Ultimos Sismos',
                              ruta: '/sismo',
                              color1: Color(0xFF6D4C41).withOpacity(0.7),
                              color2: Color(0xFF795548).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                          ]),
                          TableRow(children: [
                            BigAppButtom(
                              icono: FontAwesomeIcons.moneyBill,
                              texto: 'Valor de Divisas',
                              ruta: '/moneda',
                              color1: Color(0xFF558B2F).withOpacity(0.7),
                              color2: Color(0xFF2E7D32).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                            BigAppButtom(
                              icono: FontAwesomeIcons.creditCard,
                              texto: 'Saldo Bip\n(En Mantención)',
                              ruta: '/bip',
                              color1: Color(0xFF0277BD).withOpacity(0.7),
                              color2: Color(0xFF01579B).withOpacity(0.7),
                              controller: _.myBanner,
                            ),
                          ]),
                        ],
                      ),
                      AppButtom(
                        icono: FontAwesomeIcons.infoCircle,
                        texto: 'Acerca de Chile MiniApps',
                        ruta: '/info_page',
                        color1: Color(0xFFf83600).withOpacity(0.4),
                        color2: Color(0xFFfe8c00).withOpacity(0.6),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      adContainer,
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
