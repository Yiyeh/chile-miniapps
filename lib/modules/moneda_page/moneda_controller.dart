import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MonedaController extends GetxController {
  Future<Map<String, dynamic>> getMonedas() async {
    var url = Uri.parse('https://mindicador.cl/api');
    final respuesta = await http.get(url);

    Map<String, dynamic> map = jsonDecode(respuesta.body);

    return map;
  }
}
