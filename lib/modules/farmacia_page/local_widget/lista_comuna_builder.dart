import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/data/models/farmacia_model.dart';
import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListaComunaBuilder extends StatelessWidget {
  final String comuna;

  final String tipo;

  const ListaComunaBuilder({Key key, this.tipo, this.comuna}) : super(key: key);

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
        return Container(
          child: FutureBuilder(
            future: _.getFarmacias(tipo),
            builder:
                (BuildContext context, AsyncSnapshot<List<Farmacia>> snapshot) {
              final List<Farmacia> listaComunas = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CargandoWidget();
              } else {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      adContainer,
                      SizedBox(height: 10,),
                      Expanded(child: enlistarComunas(listaComunas, comuna)),
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

  Widget enlistarComunas(List<Farmacia> listaComuna, String comuna) {
    final List<String> listaComunaFinal = [];

    listaComuna.forEach((farmacia) {
      if (farmacia.fkRegion == comuna) {
        //print(listaComunaFinal);
        //print('region de la farmacia:' + farmacia.fkRegion + ' ' + farmacia.comunaNombre);
        //print('comuna:' + comuna);

        if (listaComunaFinal.contains(farmacia.comunaNombre)) {
          //print('Coincidencia: ' + comuna);
        } else {
          listaComunaFinal.add(farmacia.comunaNombre);
        }
      }
    });

    return ListView.builder(
      itemCount: listaComunaFinal.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInLeft(
          child: Container(
            child: ListTile(
              title: Text(
                '${listaComunaFinal[index]}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.white),
              onTap: () {
                Navigator.pushNamed(context, '/farmacia_lista_page',
                    arguments: [listaComuna, listaComunaFinal[index]]);
              },
            ),
          ),
        );
      },
    );
  }
}
