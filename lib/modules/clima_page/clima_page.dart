import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/clima_page/local_widgets/lista_clima_widget.dart';
import 'package:chile_miniapps/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:chile_miniapps/modules/clima_page/clima_controller.dart';

class ClimaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClimaController>(
      init: ClimaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: appBarBackground,
              title: TextoAppBar(
                texto: 'Clima',
              ),
            ),
            body: Container(
              decoration: backgroundDecoration,
              child: ListaClimaBuilder(),
            ),
          ),
        );
      },
    );
  }
}
