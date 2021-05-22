import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/farmacia_page/farmacia_controller.dart';
import 'package:chile_miniapps/theme/my_theme.dart';

class FarmaciaRegionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final String tipo = ModalRoute.of(context).settings.arguments;

    return GetBuilder<FarmaciaController>(
      init: FarmaciaController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Seleccione una Región',
              ),
              backgroundColor: appBarBackground,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: backgroundDecoration,
              child: FadeInLeft(
                child: Container(
                  child: listaRegiones(_, tipo),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget listaRegiones(FarmaciaController _, String tipo) {
    return ListView.builder(
      itemCount: _.listaRegiones.length,
      itemBuilder: (BuildContext context, int index) {
        return _regionesItems(context, _.listaRegiones[index], index + 1, tipo);
      },
    );
  }

  Widget _regionesItems(BuildContext context, String region, int index, tipo) {
    return Container(
      child: ListTile(
        title: Text(
          '$region',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.white),
        onTap: () {
          Navigator.pushNamed(context, '/farmacia_comuna', arguments: [index, tipo]);
        },
      ),
    );
  }
}
