import 'package:chile_miniapps/providers/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:chile_miniapps/global_widgets/error_coneccion_widget.dart';
import 'package:chile_miniapps/global_widgets/cargando_widget.dart';
import 'package:chile_miniapps/data/models/notificacion_model.dart';
import 'package:chile_miniapps/modules/notification_page/notification_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ListaNotificationBuilder extends StatelessWidget {
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

    return GetBuilder<NotificationController>(
      init: NotificationController(),
      initState: (_) {},
      builder: (_) {
        return FutureBuilder(
          future: _.getNotificaciones(),
          builder: (BuildContext context, AsyncSnapshot<List<Notificacion>> snapshot) {
            final List<Notificacion> listaSismos = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CargandoWidget();
            } else {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    SizedBox(height: 10,),
                    adContainer,
                    SizedBox(height: 10,),
                    Expanded(child: lista(listaSismos)),
                  ],
                );
              } else {
                return ConnectionErrorWidget();
              }
            }
          },
        );
      },
    );
  }

  Widget lista(List listaSismos) {
    return ListView.builder(
      itemCount: listaSismos.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInLeft(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: ListTile(
              title: Text(
                '${listaSismos[index].titulo}\n',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${listaSismos[index].contenido}\n\nFecha: ${listaSismos[index].fecha}',
                style: TextStyle(color: Colors.white),
              ),
              leading: FaIcon(
                FontAwesomeIcons.exclamationCircle,
                color: Colors.lightBlue,
                size: 30,
              ),
              trailing: FaIcon(
                FontAwesomeIcons.check,
                color: Colors.green,
              ),
            ),
          ),
        );
      },
    );
  }
}
