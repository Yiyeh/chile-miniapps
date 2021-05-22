import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:chile_miniapps/data/models/feriado_model.dart';
import 'package:url_launcher/url_launcher.dart';

class FeriadoController extends GetxController {
  Future<List<Feriado>> getFeriados() async {
    var url = Uri.parse('https://apis.digital.gob.cl/fl/feriados/2021');
    final resp = await http.get(url);
    return feriadoFromJson(resp.body);
  }

  String getMes(int mes) {
    switch (mes) {
      case 1:
        return 'Enero';
        break;

      case 2:
        return 'Febrero';
        break;

      case 3:
        return 'Marzo';
        break;

      case 4:
        return 'Abril';
        break;

      case 5:
        return 'Mayo';
        break;

      case 6:
        return 'Junio';
        break;

      case 7:
        return 'Julio';
        break;

      case 8:
        return 'Agosto';
        break;

      case 9:
        return 'Septiembre';
        break;

      case 10:
        return 'Octubre';
        break;

      case 11:
        return 'Noviembre';
        break;

      case 12:
        return 'Diciembre';
        break;

      default:
        return 'Error';
    }
  }

  FaIcon getIcon(String tipo) {
    switch (tipo) {
      case 'Civil':
        return FaIcon(
          FontAwesomeIcons.university,
          color: Colors.white,
          size: 120,
        );
        break;

      case 'Religioso':
        return FaIcon(
          FontAwesomeIcons.cross,
          color: Colors.white,
          size: 120,
        );
        break;

      default:
        return FaIcon(
          FontAwesomeIcons.question,
          color: Colors.white,
          size: 120,
        );
        break;
    }
  }

  launchURL(String uri) async {
    final url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir $url';
    }
  }
}
