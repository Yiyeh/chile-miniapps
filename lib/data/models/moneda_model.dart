import 'dart:convert';

Moneda monedaFromJson(String str) => Moneda.fromJson(json.decode(str));

String monedaToJson(Moneda data) => json.encode(data.toJson());

class Moneda {
    Moneda({
        this.version,
        this.autor,
        this.fecha,
        this.uf,
        this.ivp,
        this.dolar,
        this.dolarIntercambio,
        this.euro,
        this.ipc,
        this.utm,
        this.imacec,
        this.tpm,
        this.libraCobre,
        this.tasaDesempleo,
        this.bitcoin,
    });

    String version;
    String autor;
    DateTime fecha;
    Bitcoin uf;
    Bitcoin ivp;
    Bitcoin dolar;
    Bitcoin dolarIntercambio;
    Bitcoin euro;
    Bitcoin ipc;
    Bitcoin utm;
    Bitcoin imacec;
    Bitcoin tpm;
    Bitcoin libraCobre;
    Bitcoin tasaDesempleo;
    Bitcoin bitcoin;

    factory Moneda.fromJson(Map<String, dynamic> json) => Moneda(
        version: json["version"],
        autor: json["autor"],
        fecha: DateTime.parse(json["fecha"]),
        uf: Bitcoin.fromJson(json["uf"]),
        ivp: Bitcoin.fromJson(json["ivp"]),
        dolar: Bitcoin.fromJson(json["dolar"]),
        dolarIntercambio: Bitcoin.fromJson(json["dolar_intercambio"]),
        euro: Bitcoin.fromJson(json["euro"]),
        ipc: Bitcoin.fromJson(json["ipc"]),
        utm: Bitcoin.fromJson(json["utm"]),
        imacec: Bitcoin.fromJson(json["imacec"]),
        tpm: Bitcoin.fromJson(json["tpm"]),
        libraCobre: Bitcoin.fromJson(json["libra_cobre"]),
        tasaDesempleo: Bitcoin.fromJson(json["tasa_desempleo"]),
        bitcoin: Bitcoin.fromJson(json["bitcoin"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "autor": autor,
        "fecha": fecha.toIso8601String(),
        "uf": uf.toJson(),
        "ivp": ivp.toJson(),
        "dolar": dolar.toJson(),
        "dolar_intercambio": dolarIntercambio.toJson(),
        "euro": euro.toJson(),
        "ipc": ipc.toJson(),
        "utm": utm.toJson(),
        "imacec": imacec.toJson(),
        "tpm": tpm.toJson(),
        "libra_cobre": libraCobre.toJson(),
        "tasa_desempleo": tasaDesempleo.toJson(),
        "bitcoin": bitcoin.toJson(),
    };
}

class Bitcoin {
    Bitcoin({
        this.codigo,
        this.nombre,
        this.unidadMedida,
        this.fecha,
        this.valor,
    });

    String codigo;
    String nombre;
    UnidadMedida unidadMedida;
    DateTime fecha;
    double valor;

    factory Bitcoin.fromJson(Map<String, dynamic> json) => Bitcoin(
        codigo: json["codigo"],
        nombre: json["nombre"],
        unidadMedida: unidadMedidaValues.map[json["unidad_medida"]],
        fecha: DateTime.parse(json["fecha"]),
        valor: json["valor"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "unidad_medida": unidadMedidaValues.reverse[unidadMedida],
        "fecha": fecha.toIso8601String(),
        "valor": valor,
    };
}

enum UnidadMedida { DLAR, PESOS, PORCENTAJE }

final unidadMedidaValues = EnumValues({
    "Dólar": UnidadMedida.DLAR,
    "Pesos": UnidadMedida.PESOS,
    "Porcentaje": UnidadMedida.PORCENTAJE
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