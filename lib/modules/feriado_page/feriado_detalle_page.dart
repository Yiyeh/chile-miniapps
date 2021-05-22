import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:chile_miniapps/data/models/feriado_model.dart';
import 'package:chile_miniapps/global_widgets/textos_widget.dart';
import 'package:chile_miniapps/modules/feriado_page/feriado_controller.dart';
import 'package:chile_miniapps/theme/my_theme.dart';

class FeriadoDetallePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Feriado feriado = ModalRoute.of(context).settings.arguments;

    return GetBuilder<FeriadoController>(
      init: FeriadoController(),
      initState: (_) {},
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TextoAppBar(
                texto: 'Detalles',
              ),
              backgroundColor: appBarBackground,
            ),
            body: SafeArea(
              child: Container(
                decoration: backgroundDecoration,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Container(
                            margin: EdgeInsetsDirectional.only(top: 20),
                            width: double.infinity,
                            child: feriadoDetallado(_, feriado, context),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget feriadoDetallado(
      FeriadoController _, Feriado feriado, BuildContext context) {
    final mes = _.getMes(feriado.fecha.month);
    final irrenunciable = (feriado.irrenunciable == '1') ? 'Si' : 'No';

    return FadeInLeft(
      child: Container(
        color: Colors.white10,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            FadeInDown(child: _.getIcon(feriado.tipo), from: 20,),
            SizedBox(
              height: 15,
            ),
            Text(
              '${feriado.nombre}',
              style: TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Text(
              '\nFecha: ${feriado.fecha.day} de $mes del ${feriado.fecha.year}',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'Irrenunciable: $irrenunciable',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              'Tipo: ${feriado.tipo}',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),

            /* Text('\nLeyes:', textAlign:TextAlign.left, style: TextStyle(fontSize: 15, color: Colors.white),),

            Expanded(
                child: ListView.builder(
                itemCount: feriado.leyes.length,
                itemBuilder: (BuildContext context, int i) {
                return ListTile(
                  
                  title: Text('${feriado.leyes[i].nombre}', style: TextStyle(fontSize: 13, color: Colors.white), ),
                  subtitle: Text('${feriado.leyes[i].url}', style: TextStyle(fontSize: 12 ,color: Colors.white)),
                  trailing: GestureDetector(onTap: (){
                    _.launchURL('${feriado.leyes[i].url}');
                  }, 
                  child: Icon(Icons.chevron_right, color: Colors.white,)
                  ),
                );
               },
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
