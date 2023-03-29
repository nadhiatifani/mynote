import 'dart:convert';

List<Mynote?>? mynoteFromJson(String str) => json.decode(str) == null ? [] : List<Mynote?>.from(json.decode(str)!.map((x) => Mynote.fromJson(x)));

String mynoteToJson(List<Mynote?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Mynote {
    Mynote({
        this.id,
        this.judul,
        this.konten,
        this.date,
    });

    String? id;
    String? judul;
    String? konten;
    DateTime? date;

    factory Mynote.fromJson(Map<String, dynamic> json) => Mynote(
        id: json["id"],
        judul: json["judul"],
        konten: json["konten"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "konten": konten,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    };
}
