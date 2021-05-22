import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/data/models/sismo_model.dart';
import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/modules/sismo_page/sismo_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListaSismoBuilder extends StatelessWidget {
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
    

    return GetBuilder<SismoController>(
      init: SismoController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          child: FutureBuilder(
            future: _.getSismos(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Sismo>> snapshot) {
              final listaSismos = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CargandoWidget();
              } else {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      adContainer,                      
                      SizedBox(height: 10,),
                      Expanded(child: enlistarSismos(_, listaSismos)),
                    ],
                  );
                } else {
                  return ConnectionErrorWidget();
                }
              }
            },
          ),
        );
      },
    );
  }

  Widget enlistarSismos(SismoController _, List<Sismo> listaSismos) {
    final TextStyle estiloTexto = TextStyle(color: Colors.white);

    return FadeInLeft(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
            itemCount: listaSismos.length,
            itemBuilder: (BuildContext context, int i) {
              final nuevaFecha = _.getFechaNueva(listaSismos[i]);

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white10, borderRadius: BorderRadius.circular(5)),
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/sismo_detalle',
                        arguments: listaSismos[i]);
                  },
                  title:
                      Text('${listaSismos[i].refGeografica}', style: estiloTexto),
                  subtitle: Text(
                      '$nuevaFecha \nProfundidad: ${listaSismos[i].profundidad}Km.',
                      style: TextStyle(color: Colors.white)),
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 70),
                    child: Text('${listaSismos[i].magnitud.trim()}',
                        style: TextStyle(
                            color: _.colorMagnitud(listaSismos[i].magnitud.trim()),
                            fontSize: 18)),
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
