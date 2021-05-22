

import 'dart:convert';

List<Clima> climaFromJson(String str) => List<Clima>.from(json.decode(str).map((x) => Clima.fromJson(x)));

String climaToJson(List<Clima> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Clima {
    Clima({
        this.codigo,
        this.estacion,
        this.horaUpdate,
        this.temp,
        this.humedad,
        this.estado,
        this.icono,
    });

    String codigo;
    String estacion;
    String horaUpdate;
    String temp;
    String humedad;
    String estado;
    String icono;

    factory Clima.fromJson(Map<String, dynamic> json) => Clima(
        codigo: json["Codigo"],
        estacion: json["Estacion"],
        horaUpdate: json["HoraUpdate"],
        temp: json["Temp"],
        humedad: json["Humedad"],
        estado: json["Estado"],
        icono: json["Icono"],
    );

    Map<String, dynamic> toJson() => {
        "Codigo": codigo,
        "Estacion": estacion,
        "HoraUpdate": horaUpdate,
        "Temp": temp,
        "Humedad": humedad,
        "Estado": estado,
        "Icono": icono,
    };
}



class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
