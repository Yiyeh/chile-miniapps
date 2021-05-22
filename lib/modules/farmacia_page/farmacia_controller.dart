import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:chile_miniapps/data/models/farmacia_model.dart';

class FarmaciaController extends GetxController {
  
  Future<List<Farmacia>> getFarmacias(tipo) async {
    var url;

    if (tipo == 'turno')
     url = Uri.parse('https://farmanet.minsal.cl/maps/index.php/ws/getLocalesTurnos');
    else
       url = Uri.parse('https://farmanet.minsal.cl/maps/index.php/ws/getLocales');

    final respuesta = await http.get(url);

    List<Farmacia> farmacias = farmaciaFromJson(respuesta.body);

    Farmacia farmaciaTurnoArica = new Farmacia();
    farmaciaTurnoArica.fkRegion = '1';
    farmaciaTurnoArica.fkComuna = '1';
    farmaciaTurnoArica.comunaNombre = 'ARICA';
    farmaciaTurnoArica.localNombre = '24 HORAS (De turno)';
    farmaciaTurnoArica.localidadNombre = 'ARICA - URGENCIA';
    farmaciaTurnoArica.funcionamientoDia = 'Todo el día';
    farmaciaTurnoArica.fecha = '';
    farmaciaTurnoArica.localDireccion = 'CHACABUCCO 410';
    farmaciaTurnoArica.localTelefono = '+56954133074';
    farmaciaTurnoArica.funcionamientoHoraApertura = '00:00 hrs.';
    farmaciaTurnoArica.funcionamientoHoraCierre = '23:59 hrs.';
    farmacias.add(farmaciaTurnoArica);

    return farmacias;
  }

  List<String> listaRegiones = [
    "Arica y Parinacota",
    "Tarapacá",
    "Antofagasta",
    "Atacama",
    "Coquimbo",
    "Valparaíso",
    "Metropolitana",
    "Libertador General Bernardo O'higgins",
    "Maule",
    "Bio-Bio",
    "Araucanía",
    "Los Ríos",
    "Los Lagos",
    "Aysén",
    "Magallanes",
    "Ñuble"
  ];
}
