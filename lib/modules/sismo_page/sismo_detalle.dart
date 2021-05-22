import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:chile_miniapps/data/models/sismo_model.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/sismo_page/sismo_controller.dart';
import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:share/share.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class SismoDetalle extends StatefulWidget {
  @override
  _SismoDetalleState createState() => _SismoDetalleState();
}

class _SismoDetalleState extends State<SismoDetalle> {


  Completer<GoogleMapController> _controller = Completer();
  SismoController sismoController = new SismoController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_bannerAd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    


    final size = MediaQuery.of(context).size;

    final Sismo sismo = ModalRoute.of(context).settings.arguments;

    final nuevaFecha = sismoController.getFechaNueva(sismo);

    final double lat = double.parse(sismo.latitud);
    final double long = double.parse(sismo.longitud);

    final CameraPosition puntoInicial = CameraPosition(
    target: LatLng(lat, long),
    zoom: 8.4746,
    tilt: 50,
  );

    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: LatLng(lat, long),
    ));

    

    return Scaffold(
        appBar: AppBar(
          title: TextoAppBar(
            texto: 'Detalles del Sismo',
          ),
          backgroundColor: appBarBackground,
          actions: [
            IconButton(icon: Icon(Icons.location_on), onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(puntoInicial));
            })
          ],
        ),
        body: Container(
          height: double.infinity,
          decoration: backgroundDecoration,
          child: Column(
            children: <Widget>[
              
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: size.height * 0.45,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  markers: markers,
                  initialCameraPosition: puntoInicial,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    color: Colors.white10,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Magnitud: ${sismo.magnitud}.',
                          style: TextStyle(
                              fontSize: 25,
                              color: sismoController
                                  .colorMagnitud(sismo.magnitud.trim())),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${sismo.refGeografica}',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '\n$nuevaFecha',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        Text(
                          'Profundidad: ${sismo.profundidad} Km.',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        Text(
                          'Latitud: ${sismo.latitud} -Longitud: ${sismo.longitud}.',
                          style: TextStyle(fontSize: 13, color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          child: GestureDetector(
                            onTap: () {
                              final text =
                                  'Sismo registrado: ${sismo.refGeografica}\nMagnitud: ${sismo.magnitud}\nFecha: $nuevaFecha\nProfundidad: ${sismo.profundidad}\nLatitud: ${sismo.latitud} Longitud: ${sismo.longitud}\n\nInformación compartida desde:\n"Chile Miniapps"\nhttps://bit.ly/ChileMiniApps';
                              final description =
                                  'Sismo registrado: ${sismo.refGeografica}\nMagnitud: ${sismo.magnitud}\nFecha: $nuevaFecha\nProfundidad: ${sismo.profundidad}\nLatitud: ${sismo.latitud} Longitud: ${sismo.longitud}\n\nInformación compartida desde:\n"Chile Miniapps"\nhttps://bit.ly/ChileMiniApps';
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 15,
                      right: 20,
                      child: Text(
                        'Chile MiniApps',
                        style: TextStyle(color: Colors.white24),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
