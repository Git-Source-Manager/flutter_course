class StateModel {
  String name;
  String iso2;
  int id;

  StateModel({
    required this.name,
    required this.iso2,
    required this.id,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      name: json['name'] ?? 'Tamil Nadu',
      iso2: json['iso2'] ?? 'TN',
      id: json['id'] ?? 28,
    );
  }
}