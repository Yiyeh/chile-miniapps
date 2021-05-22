import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_controller.dart';
import 'package:chile_miniapps/theme/my_theme.dart';

class FarmaciaDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FarmaciaController>(
      init: FarmaciaController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: TextoAppBar(texto: 'Detalles',),
            backgroundColor: appBarBackground,
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset(0.0, 0.6),
                    end: FractionalOffset(0.0, 1.0),
                    colors: [
                  Color.fromRGBO(52, 54, 101, 1.0),
                  Color.fromRGBO(35, 37, 57, 1.0)
                ])),
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}
