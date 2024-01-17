class UserCars {
  String id;
  String name;
  String brand;
  int year;
  int price;
  int distance;
  dynamic duration;
  String transmission;
  String fuel;
  String city;
  String location;
  String description;
  String phone;
  String type;
  String durationType;
  String topSpeed;
  List<CarImage> images;
  // String firstName;
  // String lastName;
  UserCars(
      {required this.id,
      required this.images,
      required this.topSpeed,
      // required this.firstName,
      // required this.lastName,
      required this.city,
      required this.phone,
      required this.brand,
      required this.price,
      required this.distance,
      required this.transmission,
      required this.duration,
      required this.fuel,
      required this.location,
      required this.description,
      required this.type,
      required this.name,
      required this.year,
      required this.durationType});
  factory UserCars.fromJson(Map<String, dynamic> jsonData) {
    return UserCars(
        // firstName: jsonData['userId']['firstName'] ?? '',
        // lastName: jsonData['userId']['lastName'] ?? '',
        id: jsonData['_id'],
        images: (jsonData['images'] as List<dynamic>)
            .map((image) => CarImage.fromJson(image))
            .toList(),
        // images: jsonData['images'] ?? '',
        city: jsonData['city'] ?? '',
        phone: jsonData['phone'] ?? '',
        brand: jsonData['brand'] ?? '',
        price: jsonData['price'] ?? '',
        distance: jsonData['distance'] ?? 0,
        transmission: jsonData['transmission'] ?? '',
        duration: jsonData['duration'] ?? '',
        fuel: jsonData['fuel'] ?? '',
        location: jsonData['location'] ?? '',
        description: jsonData['description'] ?? '',
        type: jsonData['type'] ?? '',
        name: jsonData['name'] ?? '',
        year: jsonData['year'] ?? '',
        topSpeed: jsonData['topSpeed'] ?? '',
        durationType: jsonData['durationType'] ?? '');
  }
}

class CarImage {
  final String secureUrl;
  final String publicId;
  final String id;

  CarImage({
    required this.secureUrl,
    required this.publicId,
    required this.id,
  });

  factory CarImage.fromJson(Map<String, dynamic> json) {
    return CarImage(
      secureUrl: json['secure_url'],
      publicId: json['public_id'],
      id: json['_id'],
    );
  }
}
