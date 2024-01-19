class CityModel {
  String name;
  int id;

  CityModel({
    required this.name,
    required this.id,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      name: json['name'] ?? 'Chennai',
      id: json['id'] ?? 37,
    );
  }
}