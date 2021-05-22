import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:chile_miniapps/modules/agenda_page/agenda_controller.dart';
import 'package:chile_miniapps/modules/agenda_page/local_widgets/lista_agenda_widget.dart';

class AgendaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgendaController>(
      init: AgendaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(

          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(texto: 'Agenda Telefónica',),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: backgroundDecoration,
              child: ListaAgendaBuilder(),
            ),
          ),

        );
      },
    );
  }
}
