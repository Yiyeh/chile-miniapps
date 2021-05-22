import 'package:flutter/material.dart';

import 'package:get/state_manager.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';

import 'package:chile_miniapps/modules/feriado_page/feriado_controller.dart';
import 'package:chile_miniapps/modules/feriado_page/local_widgets/lista_feriado_widget.dart';
import 'package:chile_miniapps/theme/my_theme.dart';

class FeriadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final year = DateTime.now().year.toString();

    return GetBuilder<FeriadoController>(
      init: FeriadoController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Feriados $year',
              ),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: backgroundDecoration,
              child: ListaFeriadoBuilder(),
            ),
          ),
        );
      },
    );
  }
}
