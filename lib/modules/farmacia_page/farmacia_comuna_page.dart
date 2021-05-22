import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_controller.dart';
import 'package:chile_miniapps/modules/farmacia_page/local_widget/lista_comuna_builder.dart';
import 'package:chile_miniapps/theme/my_theme.dart';

class FarmaciaComunaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List argumentos = ModalRoute.of(context).settings.arguments;
    
    final String region = argumentos[0].toString();
    final String tipo = argumentos[1];

    
    //print(region);
    //print(tipo);

    return GetBuilder<FarmaciaController>(
      init: FarmaciaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(texto: 'Seleccione una Comuna'),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: backgroundDecoration,
              child: ListaComunaBuilder(comuna: region, tipo: tipo,),
              
            ),
          ),
        );
      },
    );
  }
}
