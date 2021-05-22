import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/sismo_page/local_widgets/lista_sismo_builder.dart';


import 'package:chile_miniapps/modules/sismo_page/sismo_controller.dart';
import 'package:chile_miniapps/theme/my_theme.dart';

class SismoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SismoController>(
      init: SismoController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(texto: 'Ultimos Sismos en Chile',),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: backgroundDecoration,
              child: ListaSismoBuilder(),
            ),
          ),
        );
      },
    );
  }
}
