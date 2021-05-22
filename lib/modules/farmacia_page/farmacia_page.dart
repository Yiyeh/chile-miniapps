import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/state_manager.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';

import 'package:chile_miniapps/modules/farmacia_page/farmacia_controller.dart';
import 'package:chile_miniapps/modules/farmacia_page/local_widget/opcion_widget.dart';
import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class FarmaciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final BannerAd myBanner = BannerAd(
      //test ad
      adUnitId: miBannerID,

      
      size: AdSize.banner,
      request: AdRequest(),
      listener: AdListener(),
    );

    
    myBanner.load();

    final AdWidget adWidget = AdWidget(ad: myBanner);

    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );

    
    return GetBuilder<FarmaciaController>(
      init: FarmaciaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Elija una Opción',
              ),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: backgroundDecoration,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: FadeInLeft(
                  child: Column(
                    children: [
                      OpcionWidgetButtom(
                          tipo: 'turno',
                          icono: FontAwesomeIcons.userClock,
                          texto: 'Farmacias de Turno'),
                          
                      OpcionWidgetButtom(
                          tipo: 'todas',
                          icono: FontAwesomeIcons.flag,
                          texto: 'Todas las Farmacias'),

                      SizedBox(height: 10,),
                      adContainer,
                      SizedBox(height: 10,),
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
