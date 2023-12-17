class CarModel {
  String id;
  String name;
  String img;
  final String brandId;
  int price;
  int sales;
  String bodyType;
  String clyinders;
  String displacement;
  String power;
  String torque;
  String fullSystem;
  String fuel;
  String fuelCapacity;
  String topSpeed;
  String acceleration;
  String driveType;
  String gearBox;
  String tireSize;
  String length;
  String width;
  String height;
  String frontRearTrack;
  String wheelBase;
  String groundClearance;
  String cargoVolume;
  String aerodynamics;
  String unladenWeight;
  String grossWeightLimit;
  String cityFuelConsumption;
  String highwayFuelConsumption;
  String FuelConsumptionCombined;
  String co2Emissions;
  // List<String> yearsOfProduction;
  String frontBreaks;
  String rearBreaks;
  String createdAt;
  String updatedAt;

  CarModel({
    required this.name,
    required this.length,
    required this.width,
    required this.height,
    required this.img,
    required this.id,
    required this.acceleration,
    required this.aerodynamics,
    required this.bodyType,
    required this.brandId,
    required this.cargoVolume,
    required this.cityFuelConsumption,
    required this.clyinders,
    required this.co2Emissions,
    required this.createdAt,
    required this.displacement,
    required this.driveType,
    required this.frontBreaks,
    required this.frontRearTrack,
    required this.fuel,
    required this.fuelCapacity,
    required this.fullSystem,
    required this.FuelConsumptionCombined,
    required this.gearBox,
    required this.grossWeightLimit,
    required this.groundClearance,
    required this.highwayFuelConsumption,
    required this.power,
    required this.price,
    required this.rearBreaks,
    required this.sales,
    required this.tireSize,
    required this.topSpeed,
    required this.torque,
    required this.unladenWeight,
    required this.updatedAt,
    required this.wheelBase,
    //required this.yearsOfProduction
  });

  factory CarModel.fromJson(Map<String, dynamic> jsonData) {
    return CarModel(
      name: jsonData['name'] ?? '',
      length: jsonData['length'] ?? '',
      width: jsonData['width'] ?? '',
      height: jsonData['height'] ?? '',
      img: jsonData['image'] ?? '',
      id: jsonData['_id'],
      acceleration: jsonData["acceleration"] ?? '',
      aerodynamics: jsonData["aerodynamics"] ?? '',
      bodyType: jsonData['bodyType'] ?? '',
      brandId: jsonData['brandId'] ?? '',
      cargoVolume: jsonData['cargoVolume'] ?? '',
      cityFuelConsumption: jsonData['cityFuelConsumption'] ?? '',
      clyinders: jsonData['clyinders'] ?? '',
      co2Emissions: jsonData['co2Emissions'] ?? '',
      createdAt: jsonData['createdAt'] ?? '',
      displacement: jsonData['displacement'] ?? '',
      driveType: jsonData['driveType'] ?? '',
      frontBreaks: jsonData['frontBreaks'] ?? '',
      frontRearTrack: jsonData['frontRearTrack'] ?? '',
      fuel: jsonData['fuel'] ?? '',
      fuelCapacity: jsonData['fuelCapacity'] ?? '',
      fullSystem: jsonData['fullSystem'] ?? '',
      FuelConsumptionCombined: jsonData['FuelConsumptionCombined'] ?? '',
      gearBox: jsonData['gearBox'] ?? '',
      grossWeightLimit: jsonData['grossWeightLimit'] ?? '',
      groundClearance: jsonData['groundClearance'] ?? '',
      highwayFuelConsumption: jsonData['highwayFuelConsumption'] ?? '',
      power: jsonData['power'] ?? '',
      price: jsonData['price'] ?? '',
      rearBreaks: jsonData['rearBreaks'] ?? '',
      sales: jsonData['sales'] ?? 0,
      tireSize: jsonData['tireSize'] ?? '',
      topSpeed: jsonData['topSpeed'] ?? 'Unknown',
      torque: jsonData['torque'] ?? '',
      unladenWeight: jsonData['unladenWeight'] ?? '',
      updatedAt: jsonData['updatedAt'] ?? '',
      wheelBase: jsonData['wheelBase'] ?? '',
      //   yearsOfProduction: 'yearsOfProduction'
    );
  }
}
