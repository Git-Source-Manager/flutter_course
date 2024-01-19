import 'dart:convert';

List<Users> userFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String userToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.createdAt,
    this.name,
    this.avatar,
    this.id,
    this.qualifications,
  });

  DateTime? createdAt;
  String? name;
  String? avatar;
  String? id;
  List<Qualification>? qualifications;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
        qualifications: json["qualifications"] != null
            ? List<Qualification>.from(
                json["qualifications"].map((x) => Qualification.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "qualifications": qualifications != null
            ? List<dynamic>.from(qualifications!.map((x) => x.toJson()))
            : [],
      };
}

class Qualification {
  Qualification({
    this.degree,
    this.completionData,
  });

  String? degree;
  String? completionData;

  factory Qualification.fromJson(Map<String, dynamic> json) => Qualification(
        degree: json["degree"],
        completionData: json["completionData"],
      );

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "completionData": completionData,
      };
}