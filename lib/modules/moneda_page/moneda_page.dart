import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/moneda_page/moneda_controller.dart';
import 'package:chile_miniapps/modules/moneda_page/local_widgets/lista_moneda_widget.dart';

class MonedaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MonedaController>(
      init: MonedaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Valor de Monedas',
              ),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: backgroundDecoration,
              child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  child: ListaMonedaBuilder()),
            ),
          ),
        );
      },
    );
  }
}
