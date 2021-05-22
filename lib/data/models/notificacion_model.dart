import 'dart:convert';

List<Notificacion> notificacionFromJson(String str) =>
    List<Notificacion>.from(
        json.decode(str).map((x) => Notificacion.fromJson(x)));

String notificacionToJson(List<Notificacion> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notificacion {
  Notificacion({
    this.id,
    this.titulo,
    this.contenido,
    this.fecha,
  });

  String id;
  String titulo;
  String contenido;
  String fecha;

  factory Notificacion.fromJson(Map<String, dynamic> json) => Notificacion(
        id: json["id"],
        titulo: json["titulo"],
        contenido: json["contenido"],
        fecha: json["fecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "contenido": contenido,
        "fecha": fecha,
      };
}
