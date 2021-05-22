import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/modules/agenda_page/agenda_controller.dart';
import 'package:chile_miniapps/data/models/agenda_model.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:share/share.dart';

class ListaAgendaBuilder extends StatelessWidget {

  

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


    return GetBuilder<AgendaController>(
      init: AgendaController(),
      initState: (_) {},
      builder: (_) {
        return FutureBuilder(
          future: _.getNumeros(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Numero>> snapshot) {
            final listaAgenda = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CargandoWidget();
            } else {
              if (snapshot.hasData) {
                return Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        adContainer,
                        SizedBox(height: 10,),
                        
                        Expanded(child: enlistarAgenda(_, listaAgenda)),
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

  Widget enlistarAgenda(AgendaController _, List<Numero> listaAgenda) {
    return ListView.builder(
      itemCount: listaAgenda.length,
      itemBuilder: (BuildContext context, int i) {
        return FadeInLeft(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
                color: Colors.white10, borderRadius: BorderRadius.circular(5)),
            child: ListTile(
              title: Text(
                'Código: ${listaAgenda[i].codigo}\nAlcance: ${listaAgenda[i].ubicacion}',
                style: TextStyle(color: Colors.white, fontSize: 13),
                textAlign: TextAlign.start,
              ),
              subtitle: Text('\n${listaAgenda[i].descripcion}',
                  style: TextStyle(color: Colors.white)),
              leading: CircleAvatar(
                  child: Text(
                '${listaAgenda[i].descripcion[0]}',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.justify,
              )),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _.llamarNumero("tel://${listaAgenda[i].codigo}");
                    },
                    child: FaIcon(
                      FontAwesomeIcons.phoneAlt,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      final text =
                          'Código: ${listaAgenda[i].codigo}\nAlcance: ${listaAgenda[i].ubicacion}\n${listaAgenda[i].descripcion}\n\nInformación compartida desde:\n"Chile Miniapps"\nhttps://bit.ly/ChileMiniApps';
                      final description =
                          'Código: ${listaAgenda[i].codigo}\nAlcance: ${listaAgenda[i].ubicacion}\n${listaAgenda[i].descripcion}\n\nInformación compartida desde:\n"Chile Miniapps"\nhttps://bit.ly/ChileMiniApps';
                      Share.share(text, subject: description);
                    },
                    child: FaIcon(
                      FontAwesomeIcons.shareAlt,
                      color: Colors.lightBlue,
                      size: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
