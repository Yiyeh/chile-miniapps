import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_comuna_page.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_lista_page.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_page.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_region_page.dart';


import 'package:chile_miniapps/modules/home_page/home_page.dart';
import 'package:chile_miniapps/modules/info_page/info_page.dart';
import 'package:chile_miniapps/modules/notification_page/notification_page.dart';
import 'package:chile_miniapps/modules/clima_page/clima_page.dart';
import 'package:chile_miniapps/modules/moneda_page/moneda_page.dart';
import 'package:chile_miniapps/modules/agenda_page/agenda_page.dart';
import 'package:chile_miniapps/modules/feriado_page/feriado_detalle_page.dart';
import 'package:chile_miniapps/modules/feriado_page/feriado_page.dart';
import 'package:chile_miniapps/modules/sismo_page/sismo_detalle.dart';
import 'package:chile_miniapps/modules/sismo_page/sismo_page.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();
  
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.black));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/'                   : (BuildContext context) => HomePage(),
        '/notificacion'       : (BuildContext context) => NotificacionesPage(),
        '/clima'              : (BuildContext context) => ClimaPage(),
        '/moneda'             : (BuildContext context) => MonedaPage(),
        '/agenda'             : (BuildContext context) => AgendaPage(),
        '/feriado'            : (BuildContext context) => FeriadoPage(),
        '/feriado_detalle'    : (BuildContext context) => FeriadoDetallePage(),
        '/sismo'              : (BuildContext context) => SismoPage(),
        '/sismo_detalle'      : (BuildContext context) => SismoDetalle(),
        '/farmacia'           : (BuildContext context) => FarmaciaPage(),
        '/farmacia_region'    : (BuildContext context) => FarmaciaRegionPage(),
        '/farmacia_comuna'    : (BuildContext context) => FarmaciaComunaPage(),
        '/farmacia_lista_page': (BuildContext context) => ListaFarmaciaPage(),
        '/info_page'          : (BuildContext context) => InfoPage(),
      },
    );
  }
}
