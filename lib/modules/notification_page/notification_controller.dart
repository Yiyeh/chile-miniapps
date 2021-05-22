import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import 'package:chile_miniapps/data/models/notificacion_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationController extends GetxController {
  Future<List<Notificacion>> getNotificaciones() async {
    var url = Uri.parse('https://pastebin.com/raw/UQy2kp7t');
    final response = await http.get(url);
    return notificacionFromJson(response.body);
  }

  void launchURL(String uri) async {
    final url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir $url';
    }
  }
}
