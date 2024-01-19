import 'dart:convert';

class Breed {
  final int? id;
  final String name;
  final String description;

  Breed({this.id, required this.name, required this.description,});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'description': description,};
  }

  factory Breed.fromMap(Map<String, dynamic> map) {
    return Breed(id: map['id']?.toInt() ?? 0, name: map['name'] ?? '', description: map['description'] ?? '',);
  }

  String toJson() => json.encode(toMap());

  factory Breed.fromJson(String source) => Breed.fromMap(json.decode(source));

  @override
  String toString() => 'Breed(id: $id, name: $name, description: $description)';
}