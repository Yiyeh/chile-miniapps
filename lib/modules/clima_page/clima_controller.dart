import 'package:chile_miniapps/data/models/clima_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class ClimaController extends GetxController {
  Future<List<Clima>> getZonas() async {
    var url = Uri.parse('https://api.gael.cloud/general/public/clima');
    final respuesta = await http.get(url);

    return climaFromJson(respuesta.body);
  }

  getIcon(String icono) {
    switch (icono) {
      case 'despejado.png':
        return FaIcon(
          FontAwesomeIcons.wind,
          color: Colors.white70,
        );
        break;

      case 'parcial.png':
        return FaIcon(
          FontAwesomeIcons.cloud,
          color: Colors.blue[300],
        );
        break;

      case 'pocasnubes.png':
        return FaIcon(
          FontAwesomeIcons.cloud,
          color: Colors.blue[300],
        );
        break;

      case 'cubierto.png':
        return Icon(
          Icons.wb_cloudy,
          color: Colors.grey[300],
        );
        break;

      case 'parcialalta.png':
        return Icon(
          Icons.wb_cloudy,
          color: Colors.grey[300],
        );
        break;

      case 'niebla.png':
        return FaIcon(
          FontAwesomeIcons.smog,
          color: Colors.grey[300],
        );
        break;

      case 'nieblacubierto.png':
        return FaIcon(
          FontAwesomeIcons.smog,
          color: Colors.grey[300],
        );
        break;

      case 'despejadohumo.png':
        return FaIcon(
          FontAwesomeIcons.wind,
          color: Colors.grey[300],
        );
        break;

      case 'pocasnubesnoche.png':
        return FaIcon(
          FontAwesomeIcons.cloudMoon,
          color: Colors.grey[300],
        );
        break;

      case 'parcialaltanoche.png':
        return FaIcon(
          FontAwesomeIcons.moon,
          color: Colors.grey[300],
        );
        break;

      case 'despejadonoche.png':
        return FaIcon(
          FontAwesomeIcons.moon,
          color: Colors.grey[300],
        );
        break;

      case 'cubiertonoche.png':
        return FaIcon(
          FontAwesomeIcons.cloudMoon,
          color: Colors.grey[300],
        );
        break;

      case 'lluvianoche.png':
        return FaIcon(
          FontAwesomeIcons.cloudMoonRain,
          color: Colors.grey[300],
        );
        break;

      case 'nieblanoche.png':
        return FaIcon(
          FontAwesomeIcons.smog,
          color: Colors.grey[300],
        );
        break;

      case 'parcialnoche.png':
        return FaIcon(
          FontAwesomeIcons.moon,
          color: Colors.grey[300],
        );
        break;

      case 'lluvia.png':
        return FaIcon(
          FontAwesomeIcons.umbrella,
          color: Colors.grey[300],
        );
        break;

      case 'chubascos.png':
        return FaIcon(
          FontAwesomeIcons.cloudRain,
          color: Colors.grey[300],
        );
        break;

      case 'nieve.png':
        return FaIcon(
          FontAwesomeIcons.snowflake,
          color: Colors.grey[300],
        );
        break;

      default:
        return FaIcon(
          FontAwesomeIcons.question,
          color: Colors.white,
        );
        break;
    }
  }
}
