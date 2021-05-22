import 'dart:convert';

List<Numero> numeroFromJson(String str) => List<Numero>.from(json.decode(str).map((x) => Numero.fromJson(x)));

String numeroToJson(List<Numero> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Numero {
    Numero({
        this.codigo,
        this.ubicacion,
        this.descripcion,
    });

    String codigo;
    String ubicacion;
    String descripcion;

    factory Numero.fromJson(Map<String, dynamic> json) => Numero(
        codigo: json["codigo"],
        ubicacion: json["ubicacion"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "ubicacion": ubicacion,
        "descripcion": descripcion,
    };
}
