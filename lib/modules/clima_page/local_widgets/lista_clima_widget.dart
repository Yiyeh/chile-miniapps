import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:chile_miniapps/data/models/clima_model.dart';
import 'package:chile_miniapps/modules/clima_page/clima_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListaClimaBuilder extends StatelessWidget {

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




    return GetBuilder<ClimaController>(
      init: ClimaController(),
      initState: (_) {},
      builder: (_) {
        return FutureBuilder(
          future: _.getZonas(),
          builder: (BuildContext context, AsyncSnapshot<List<Clima>> snapshot) {
            final listaClima = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CargandoWidget();
            } else {
              if (snapshot.hasData) {
                return Container(margin: EdgeInsets.only( top: 10 , bottom: 10, left: 10, right: 10) , child: Column(
                  children: [

                    SizedBox(height: 10,),
                    adContainer,
                    SizedBox(height: 10,),
                
                    Expanded(child: enlistarClima(_, listaClima)),
                  ],
                ));
              } else {
                return ConnectionErrorWidget();
              }
            }
          },
        );
      },
    );
  }

  Widget enlistarClima(ClimaController _, List<Clima> climas) {
    return ListView.builder(
        itemCount: climas.length,
        itemBuilder: (BuildContext context, int index) {

          

          return FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(5)),
              child: ListTile(
                title: Text(
                  '${climas[index].estacion}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                subtitle: Text(
                    'Estado: ${climas[index].estado}.\nHumedad: ${climas[index].humedad}.\nÚltima hora de actualización: ${climas[index].horaUpdate}.',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
                leading: Text(
                  '${climas[index].temp}°C',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                trailing: _.getIcon(climas[index].icono),
              ),
            ),
          );
        });
  }
}
