class BrandModel {
  String name;
  String logo;
  String id;
  BrandModel({required this.name, required this.logo, required this.id});
  factory BrandModel.fromJson(Map<String, dynamic> jsonData) {
    return BrandModel(
        id: jsonData['_id'] ?? '',
        name: jsonData['name'],
        logo: jsonData['logo']);
  }
}
