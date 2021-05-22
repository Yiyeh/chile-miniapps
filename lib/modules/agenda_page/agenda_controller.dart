
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:chile_miniapps/data/models/agenda_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AgendaController extends GetxController {

  Future<List<Numero>> getNumeros() async {
    var url = Uri.parse('https://pastebin.com/raw/t1E4vSEd');
    final response = await http.get(url);
    return numeroFromJson(response.body);
  }

  llamarNumero(String uri) async {
    final url = uri;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Error.';
    }
  }

  
}
