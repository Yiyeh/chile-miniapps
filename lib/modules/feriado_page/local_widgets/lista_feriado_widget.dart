import 'package:animate_do/animate_do.dart';
import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/data/models/feriado_model.dart';
import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/modules/feriado_page/feriado_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListaFeriadoBuilder extends StatelessWidget {
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


    return GetBuilder<FeriadoController>(
      init: FeriadoController(),
      initState: (_) {},
      builder: (_) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: FutureBuilder(
            future: _.getFeriados(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Feriado>> snapshot) {
              final listaFeriados = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CargandoWidget();
              } else {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      adContainer,
                      SizedBox(height: 10,),
                      Expanded(child: enlistarFeriados(_, listaFeriados)),
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

  Widget enlistarFeriados(FeriadoController _, List<Feriado> listaFeriados) {
    final TextStyle estiloTexto = TextStyle(color: Colors.white);
    final TextStyle estiloSubtitulo = TextStyle(color: Colors.white);

    return ListView.builder(
      itemCount: listaFeriados.length,
      itemBuilder: (BuildContext context, int i) {
        final mes = _.getMes(listaFeriados[i].fecha.month);
        final icon = (listaFeriados[i].tipo == 'Civil')
            ? FaIcon(
                FontAwesomeIcons.university,
                color: Colors.white,
              )
            : FaIcon(
                FontAwesomeIcons.cross,
                color: Colors.white,
              );

        return FadeInLeft(
                  child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white10,
            ),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/feriado_detalle', arguments: listaFeriados[i]);
              },
              leading: Hero(tag: listaFeriados[i].nombre, child: icon),
              title: Text(
                '${listaFeriados[i].nombre}',
                style: estiloTexto,
              ),
              subtitle: Text(
                '${listaFeriados[i].fecha.day} de $mes',
                style: estiloSubtitulo,
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.white54,
              ),
            ),
          ),
        );
      },
    );
  }
}
