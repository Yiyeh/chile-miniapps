
import 'dart:convert';

List<Sismo> sismoFromJson(String str) => List<Sismo>.from(json.decode(str).map((x) => Sismo.fromJson(x)));

String sismoToJson(List<Sismo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sismo {
    Sismo({
        this.fecha,
        this.latitud,
        this.longitud,
        this.profundidad,
        this.magnitud,
        this.refGeografica,
        this.fechaUpdate,
    });

    String fecha;
    String latitud;
    String longitud;
    String profundidad;
    String magnitud;
    String refGeografica;
    FechaUpdate fechaUpdate;

    factory Sismo.fromJson(Map<String, dynamic> json) => Sismo(
        fecha: json["Fecha"],
        latitud: json["Latitud"],
        longitud: json["Longitud"],
        profundidad: json["Profundidad"],
        magnitud: json["Magnitud"],
        refGeografica: json["RefGeografica"],
        fechaUpdate: fechaUpdateValues.map[json["FechaUpdate"]],
    );

    Map<String, dynamic> toJson() => {
        "Fecha": fecha,
        "Latitud": latitud,
        "Longitud": longitud,
        "Profundidad": profundidad,
        "Magnitud": magnitud,
        "RefGeografica": refGeografica,
        "FechaUpdate": fechaUpdateValues.reverse[fechaUpdate],
    };
}



enum FechaUpdate { THE_01072020202002 }

final fechaUpdateValues = EnumValues({
    "01/07/2020 20:20:02": FechaUpdate.THE_01072020202002
});

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
