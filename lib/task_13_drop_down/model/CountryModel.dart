class CountryModel {
  String name;
  String iso2;
  int id;

  CountryModel({
    required this.name,
    required this.iso2,
    required this.id,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] ?? 'India',
      iso2: json['iso2'] ?? 'IN',
      id: json['id'] ?? 101,
    );
  }
}