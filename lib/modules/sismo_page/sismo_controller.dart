import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:chile_miniapps/data/models/sismo_model.dart';

class SismoController extends GetxController {
  Future<List<Sismo>> getSismos() async {
    var url = Uri.parse('https://api.gael.cloud/general/public/sismos');
    final resp = await http.get(url);
    return sismoFromJson(resp.body);
  }

  Color colorMagnitud(String magnitud) {
    if (int.parse(magnitud[0]) >= 6) {
      return Colors.red;
    } else if (int.parse(magnitud[0]) >= 5) {
      return Colors.orange;
    } else if (int.parse(magnitud[0]) >= 4) {
      return Colors.yellow;
    } else if (int.parse(magnitud[0]) >= 0) {
      return Colors.green;
    } else {
      return Colors.green;
    }
  }

  String getFechaNueva(Sismo sismo) {
    List<String> nuevaFecha = sismo.fecha.split(' ');
    String date = nuevaFecha[0].replaceAll('/', "-");
    String newDate = DateFormat("dd-MM-yyyy").format(DateTime.parse(date));
    return '$newDate ${nuevaFecha[1]}';
  }
}
