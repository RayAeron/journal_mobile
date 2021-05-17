import 'dart:convert';

List<Mark> markFromJson(String str) =>
    List<Mark>.from(json.decode(str).map((x) => Mark.fromJson(x)));

String markToJson(List<Mark> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mark {
  Mark({
    this.idMark,
    this.mark,
    this.dateMark,
    this.email,
    this.discipline,
    this.surnameStudent,
    this.nameStudent,
    this.patronymicStudent,
  });

  int idMark;
  String mark;
  String dateMark;
  String email;
  String discipline;
  String surnameStudent;
  String nameStudent;
  String patronymicStudent;

  factory Mark.fromJson(Map<String, dynamic> json) => Mark(
      idMark: json["id_mark"],
      mark: json["mark"],
      dateMark: json["date_mark"],
      email: json["email"],
      discipline: json["discipline"],
      surnameStudent: json["surname_student"],
      nameStudent: json["name_student"],
      patronymicStudent: json["patronymic_student"]);

  Map<String, dynamic> toJson() => {
        "id_mark": idMark,
        "mark": mark,
        "date_mark": dateMark,
        "email": email,
        "discipline": discipline,
        "surname_student": surnameStudent,
        "name_student": nameStudent,
        "patronymic_student": patronymicStudent,
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
