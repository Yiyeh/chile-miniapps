import 'dart:convert';

List<Farmacia> farmaciaFromJson(String str) => List<Farmacia>.from(json.decode(str).map((x) => Farmacia.fromJson(x)));

String farmaciaToJson(List<Farmacia> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Farmacia {
    Farmacia({
        this.fecha,
        this.localId,
        this.localNombre,
        this.comunaNombre,
        this.fkLocalidad,
        this.localidadNombre,
        this.localDireccion,
        this.funcionamientoHoraApertura,
        this.funcionamientoHoraCierre,
        this.localTelefono,
        this.localLat,
        this.localLng,
        this.funcionamientoDia,
        this.fkRegion,
        this.fkComuna,
    });

    String fecha;
    String localId;
    String localNombre;
    String comunaNombre;
    String fkLocalidad;
    String localidadNombre;
    String localDireccion;
    String funcionamientoHoraApertura;
    String funcionamientoHoraCierre;
    String localTelefono;
    String localLat;
    String localLng;
    String funcionamientoDia;
    String fkRegion;
    String fkComuna;

    factory Farmacia.fromJson(Map<String, dynamic> json) => Farmacia(
        fecha: json["fecha"],
        localId: json["local_id"],
        localNombre: json["local_nombre"],
        comunaNombre: json["comuna_nombre"],
        fkLocalidad: json["fk_localidad"],
        localidadNombre: json["localidad_nombre"],
        localDireccion: json["local_direccion"],
        funcionamientoHoraApertura: json["funcionamiento_hora_apertura"],
        funcionamientoHoraCierre: json["funcionamiento_hora_cierre"],
        localTelefono: json["local_telefono"],
        localLat: json["local_lat"],
        localLng: json["local_lng"],
        funcionamientoDia: json["funcionamiento_dia"],
        fkRegion: json["fk_region"],
        fkComuna: json["fk_comuna"],
    );

    Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "local_id": localId,
        "local_nombre": localNombre,
        "comuna_nombre": comunaNombre,
        "fk_localidad": fkLocalidad,
        "localidad_nombre": localidadNombre,
        "local_direccion": localDireccion,
        "funcionamiento_hora_apertura": funcionamientoHoraApertura,
        "funcionamiento_hora_cierre": funcionamientoHoraCierre,
        "local_telefono": localTelefono,
        "local_lat": localLat,
        "local_lng": localLng,
        "funcionamiento_dia": funcionamientoDia,
        "fk_region": fkRegion,
        "fk_comuna": fkComuna,
    };
}
