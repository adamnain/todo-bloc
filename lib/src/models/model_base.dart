// To parse this JSON data, do
//
//     final baseModels = baseModelsFromJson(jsonString);

import 'dart:convert';

BaseModels baseModelsFromJson(String str) => BaseModels.fromJson(json.decode(str));

String baseModelsToJson(BaseModels data) => json.encode(data.toJson());

class BaseModels {
    String status;
    List<Datum> data;

    BaseModels({
        this.status,
        this.data,
    });

    factory BaseModels.fromJson(Map<String, dynamic> json) => BaseModels(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String rmid;
    String namarm;
    Kategori kategori;
    String foto;
    String alamat;

    Datum({
        this.rmid,
        this.namarm,
        this.kategori,
        this.foto,
        this.alamat,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        rmid: json["rmid"],
        namarm: json["namarm"],
        kategori: kategoriValues.map[json["kategori"]],
        foto: json["foto"],
        alamat: json["alamat"],
    );

    Map<String, dynamic> toJson() => {
        "rmid": rmid,
        "namarm": namarm,
        "kategori": kategoriValues.reverse[kategori],
        "foto": foto,
        "alamat": alamat,
    };
}

enum Kategori { CAFE, STREETFOOD, RESTO }

final kategoriValues = EnumValues({
    "cafe": Kategori.CAFE,
    "resto": Kategori.RESTO,
    "streetfood": Kategori.STREETFOOD
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
