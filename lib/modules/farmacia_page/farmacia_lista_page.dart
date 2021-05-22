import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/data/models/farmacia_model.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_controller.dart';
import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class ListaFarmaciaPage extends StatelessWidget {
  _launchURL(String uri) async {
    final url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error.';
    }
  }

  @override
  Widget build(BuildContext context) {




    List argumentos = ModalRoute.of(context).settings.arguments;
    List<Farmacia> listaFarmacias = argumentos[0];
    String comuna = argumentos[1];

    return GetBuilder<FarmaciaController>(
      init: FarmaciaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Farmacias Comunales',
              ),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: backgroundDecoration,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListView.builder(
                  itemCount: listaFarmacias.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: [
                                
                                _farmaciaContainer(
                                    listaFarmacias[index], comuna, context),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _farmaciaContainer(
      Farmacia farmacia, String comuna, BuildContext context) {
    final estiloNombre = TextStyle(color: Colors.white, fontSize: 20);
    final estilolocalidad = TextStyle(color: Colors.white, fontSize: 13);

    if (farmacia.comunaNombre == comuna) {
      return FadeInLeft(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(5)),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${farmacia.localNombre}',
                      style: estiloNombre,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${farmacia.localidadNombre.toUpperCase()}',
                      style: estilolocalidad,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${farmacia.funcionamientoDia} ${farmacia.fecha.toLowerCase()}',
                      style: estilolocalidad,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ubicación: ${farmacia.localDireccion}',
                      style: estilolocalidad,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Teléfono: ${farmacia.localTelefono.toLowerCase()}',
                      style: estilolocalidad,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              _launchURL("tel://${farmacia.localTelefono}");
                            },
                            child: Center(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white12,
                                    radius: 15,
                                    child: FaIcon(
                                      FontAwesomeIcons.phone,
                                      color: Colors.lightGreen,
                                      size: 15,
                                    ))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              final text =
                                  'Farmacia: ${farmacia.localNombre}\nLocalidad: ${farmacia.comunaNombre}\nFecha: ${farmacia.fecha}\nDirección: ${farmacia.localDireccion}\nTeléfono: ${farmacia.localTelefono}\nApertura: ${farmacia.funcionamientoHoraApertura}\nCierre: ${farmacia.funcionamientoHoraCierre}\n\nInformación compartida desde:\n"Chile Miniapps"\nhttps://bit.ly/ChileMiniApps';
                              final description =
                                  'Farmacia: ${farmacia.localNombre}\nLocalidad: ${farmacia.comunaNombre}\nFecha: ${farmacia.fecha}\nDirección: ${farmacia.localDireccion}\nTeléfono: ${farmacia.localTelefono}\nApertura: ${farmacia.funcionamientoHoraApertura}\nCierre: ${farmacia.funcionamientoHoraCierre}\n\nInformación compartida desde:\n"Chile Miniapps"\nhttps://bit.ly/ChileMiniApps';
                              Share.share(text, subject: description);
                            },
                            child: Center(
                                child: CircleAvatar(
                                    backgroundColor: Colors.white12,
                                    radius: 15,
                                    child: FaIcon(
                                      FontAwesomeIcons.shareAlt,
                                      color: Colors.lightBlue,
                                      size: 15,
                                    ))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Apertura: ${farmacia.funcionamientoHoraApertura.toLowerCase()}',
                      style: estilolocalidad,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Cierre: ${farmacia.funcionamientoHoraCierre.toLowerCase()}',
                      style: estilolocalidad,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 10,
                  right: 14,
                  child: Text(
                    'Chile MiniApps',
                    style: TextStyle(color: Colors.white24),
                  ))
            ],
          ),
        ),
      );
    }

    return Container();
  }
}
