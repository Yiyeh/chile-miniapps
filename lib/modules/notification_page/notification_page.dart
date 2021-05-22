import 'package:chile_miniapps/modules/notification_page/local_widgets/admin_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/notification_page/notification_controller.dart';
import 'package:chile_miniapps/modules/notification_page/local_widgets/lista_ad_widget.dart';

class NotificacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
      init: NotificationController(),
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Notificaciones',
              ),
              backgroundColor: Color.fromRGBO(52, 54, 101, 1.0),
            ),
            body: Container(
              decoration: backgroundDecoration,                  
              child: Column(
                children: [
                  AdminAd(),
                  Expanded(child: Container(margin: EdgeInsets.only(bottom: 10), child: ListaNotificationBuilder())),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  
}
