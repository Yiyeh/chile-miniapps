// To parse this JSON data, do
//
//     final feriado = feriadoFromJson(jsonString);

import 'dart:convert';

List<Feriado> feriadoFromJson(String str) => List<Feriado>.from(json.decode(str).map((x) => Feriado.fromJson(x)));

String feriadoToJson(List<Feriado> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Feriado {
    Feriado({
        this.nombre,
        this.comentarios,
        this.fecha,
        this.irrenunciable,
        this.tipo,
        this.leyes,
    });

    String nombre;
    Comentarios comentarios;
    DateTime fecha;
    String irrenunciable;
    String tipo;
    List<Leye> leyes;

    factory Feriado.fromJson(Map<String, dynamic> json) => Feriado(
        nombre: json["nombre"],
        comentarios: comentariosValues.map[json["comentarios"]],
        fecha: DateTime.parse(json["fecha"]),
        irrenunciable: json["irrenunciable"],
        tipo: json["tipo"],
        leyes: json["leyes"] == null ? null : List<Leye>.from(json["leyes"].map((x) => Leye.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "comentarios": comentariosValues.reverse[comentarios],
        "fecha": "${fecha.year.toString().padLeft(4, '0')}-${fecha.month.toString().padLeft(2, '0')}-${fecha.day.toString().padLeft(2, '0')}",
        "irrenunciable": irrenunciable,
        "tipo": tipoValues.reverse[tipo],
        "leyes": leyes == null ? null : List<dynamic>.from(leyes.map((x) => x.toJson())),
    };
}

enum Comentarios { EMPTY, COMENTARIOS }

final comentariosValues = EnumValues({
    "": Comentarios.COMENTARIOS,
    " ": Comentarios.EMPTY
});

class Leye {
    Leye({
        this.nombre,
        this.url,
    });

    String nombre;
    String url;

    factory Leye.fromJson(Map<String, dynamic> json) => Leye(
        nombre: json["nombre"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "url": url,
    };
}

enum Tipo { CIVIL, RELIGIOSO }

final tipoValues = EnumValues({
    "Civil": Tipo.CIVIL,
    "Religioso": Tipo.RELIGIOSO
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
