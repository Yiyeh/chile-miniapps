import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:animate_do/animate_do.dart';

import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/modules/moneda_page/moneda_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListaMonedaBuilder extends StatelessWidget {
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


    return GetBuilder<MonedaController>(
      init: MonedaController(),
      initState: (_) {},
      builder: (_) {
        return FutureBuilder(
          future: _.getMonedas(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CargandoWidget();
            } else {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 10,),
                      adContainer,
                      SizedBox(height: 10,),
                    _botonesRedondeados(context, snapshot.data),
                    SizedBox(
                      height: 105,
                    )
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

  Widget _botonesRedondeados(context, Map<String, dynamic> data) {
    return FadeInLeft(
      child: Table(
        children: [
          TableRow(children: [
            _crearBotonMoneda(context, 'UF',
                '${data['uf']['nombre']} \nValor: ${data['uf']['valor']} CLP'),
            _crearBotonMoneda(context, 'IVP',
                '${data['ivp']['nombre']} \nValor: ${data['ivp']['valor']} CLP')
          ]),
          TableRow(children: [
            _crearBotonMoneda(context, 'Dolar',
                '${data['dolar']['nombre']} \nValor: ${data['dolar']['valor']} CLP'),
            _crearBotonMoneda(context, 'Dolar Intercambio',
                '${data['dolar_intercambio']['nombre']} \nValor: ${data['dolar_intercambio']['valor']} CLP')
          ]),
          TableRow(children: [
            _crearBotonMoneda(context, 'Euro',
                '${data['euro']['nombre']} \nValor: ${data['euro']['valor']} CLP'),
            _crearBotonMoneda(context, 'UTM',
                '${data['utm']['nombre']} \nValor: ${data['utm']['valor']} CLP')
          ]),
          TableRow(children: [
            _crearBotonMoneda(context, 'Libra de Cobre',
                '${data['libra_cobre']['nombre']} \nValor: ${data['libra_cobre']['valor']} Dolares'),
            _crearBotonMoneda(context, 'Bitcoin',
                '${data['bitcoin']['nombre']} \nValor: ${data['bitcoin']['valor']} Dolares')
          ]),
        ],
      ),
    );
  }

  Widget _crearBotonMoneda(BuildContext context, String codigo, String texto) {
    final color = Colors.white;

    return GestureDetector(
      onTap: () {
        //Navigator.pushNamed(context, pagina);
      },
      child: ClipRect(
        child: Container(
          height: 100.0,
          margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height: 5.0),
              Text(codigo, style: TextStyle(color: color, fontSize: 18)),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  texto,
                  style: TextStyle(color: color, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5.0)
            ],
          ),
        ),
      ),
    );
  }
}
