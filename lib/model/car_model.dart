// // import 'package:hive/hive.dart';
// // part 'car_model.g.dart';
// //
// // @HiveType(typeId: 0)
// // class CarModel extends HiveObject {
// //   @HiveField(0)
// //   String id;
// //   @HiveField(1)
// //   String name;
// //   @HiveField(2)
// //   String img;
// //   @HiveField(3)
// //   final String brandId;
// //   @HiveField(4)
// //   int price;
// //
// //   @HiveField(5)
// //   int sales;
// //
// //   @HiveField(6)
// //   String bodyType;
// //
// //   @HiveField(7)
// //   String clyinders;
// //
// //   @HiveField(8)
// //   String displacement;
// //
// //   @HiveField(9)
// //   String power;
// //
// //   @HiveField(10)
// //   String torque;
// //
// //   @HiveField(11)
// //   String fullSystem;
// //
// //   @HiveField(12)
// //   String fuel;
// //
// //   @HiveField(13)
// //   String fuelCapacity;
// //
// //   @HiveField(14)
// //   String topSpeed;
// //
// //   @HiveField(15)
// //   String acceleration;
// //
// //   @HiveField(16)
// //   String driveType;
// //   @HiveField(17)
// //   String gearBox;
// //
// //   @HiveField(18)
// //   String tireSize;
// //
// //   @HiveField(19)
// //   String length;
// //
// //   @HiveField(20)
// //   String width;
// //
// //   @HiveField(21)
// //   String height;
// //
// //   @HiveField(22)
// //   String frontRearTrack;
// //
// //   @HiveField(23)
// //   String wheelBase;
// //
// //   @HiveField(24)
// //   String groundClearance;
// //
// //   @HiveField(25)
// //   String cargoVolume;
// //
// //   @HiveField(26)
// //   String aerodynamics;
// //
// //   @HiveField(27)
// //   String unladenWeight;
// //
// //   @HiveField(28)
// //   String grossWeightLimit;
// //
// //   @HiveField(29)
// //   String cityFuelConsumption;
// //
// //   @HiveField(30)
// //   String highwayFuelConsumption;
// //
// //   @HiveField(31)
// //   String FuelConsumptionCombined;
// //
// //   @HiveField(32)
// //   String co2Emissions;
// //   // List<String> yearsOfProduction;
// //   @HiveField(33)
// //   String frontBreaks;
// //
// //   @HiveField(34)
// //   String rearBreaks;
// //
// //   @HiveField(35)
// //   String createdAt;
// //   @HiveField(36)
// //   String updatedAt;
// //
//   CarModel({
//     required this.name,
//     required this.length,
//     required this.width,
//     required this.height,
//     required this.img,
//     required this.id,
//     required this.acceleration,
//     required this.aerodynamics,
//     required this.bodyType,
//     required this.brandId,
//     required this.cargoVolume,
//     required this.cityFuelConsumption,
//     required this.clyinders,
//     required this.co2Emissions,
//     required this.createdAt,
//     required this.displacement,
//     required this.driveType,
//     required this.frontBreaks,
//     required this.frontRearTrack,
//     required this.fuel,
//     required this.fuelCapacity,
//     required this.fullSystem,
//     required this.FuelConsumptionCombined,
//     required this.gearBox,
//     required this.grossWeightLimit,
//     required this.groundClearance,
//     required this.highwayFuelConsumption,
//     required this.power,
//     required this.price,
//     required this.rearBreaks,
//     required this.sales,
//     required this.tireSize,
//     required this.topSpeed,
//     required this.torque,
//     required this.unladenWeight,
//     required this.updatedAt,
//     required this.wheelBase,
//     //required this.yearsOfProduction
//   });
//
//   factory CarModel.fromJson(Map<String, dynamic> jsonData) {
//     return CarModel(
//       name: jsonData['name'] ?? '',
//       length: jsonData['length'] ?? '',
//       width: jsonData['width'] ?? '',
//       height: jsonData['height'] ?? '',
//       img: jsonData['image'] ?? '',
//       id: jsonData['_id'],
//       acceleration: jsonData["acceleration"] ?? '',
//       aerodynamics: jsonData["aerodynamics"] ?? '',
//       bodyType: jsonData['bodyType'] ?? '',
//       brandId: jsonData['brandId'] ?? '',
//       cargoVolume: jsonData['cargoVolume'] ?? '',
//       cityFuelConsumption: jsonData['cityFuelConsumption'] ?? '',
//       clyinders: jsonData['clyinders'] ?? '',
//       co2Emissions: jsonData['co2Emissions'] ?? '',
//       createdAt: jsonData['createdAt'] ?? '',
//       displacement: jsonData['displacement'] ?? '',
//       driveType: jsonData['driveType'] ?? '',
//       frontBreaks: jsonData['frontBreaks'] ?? '',
//       frontRearTrack: jsonData['frontRearTrack'] ?? '',
//       fuel: jsonData['fuel'] ?? '',
//       fuelCapacity: jsonData['fuelCapacity'] ?? '',
//       fullSystem: jsonData['fullSystem'] ?? '',
//       FuelConsumptionCombined: jsonData['FuelConsumptionCombined'] ?? '',
//       gearBox: jsonData['gearBox'] ?? '',
//       grossWeightLimit: jsonData['grossWeightLimit'] ?? '',
//       groundClearance: jsonData['groundClearance'] ?? '',
//       highwayFuelConsumption: jsonData['highwayFuelConsumption'] ?? '',
//       power: jsonData['power'] ?? '',
//       price: jsonData['price'] ?? '',
//       rearBreaks: jsonData['rearBreaks'] ?? '',
//       sales: jsonData['sales'] ?? 0,
//       tireSize: jsonData['tireSize'] ?? '',
//       topSpeed: jsonData['topSpeed'] ?? 'Unknown',
//       torque: jsonData['torque'] ?? '',
//       unladenWeight: jsonData['unladenWeight'] ?? '',
//       updatedAt: jsonData['updatedAt'] ?? '',
//       wheelBase: jsonData['wheelBase'] ?? '',
//       //   yearsOfProduction: 'yearsOfProduction'
//     );
//   }
// }
// // import 'package:hive/hive.dart';
//
class CarModel {
  String id;
  String name;
  String img;
  final String brandId;
  // String price;

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

  String fuelConsumptionCombined;

  String co2Emissions;
  List<int> yearsOfProduction;
  String frontBreaks;

  String rearBreaks;

  String createdAt;
  String updatedAt;
  List<DealerShips>? dealerShips;
  int? avgPrice;
  List listImage;
  List carColors;

  CarModel(
      {required this.carColors,
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
      required this.fuelConsumptionCombined,
      required this.gearBox,
      required this.grossWeightLimit,
      required this.groundClearance,
      required this.highwayFuelConsumption,
      required this.power,
      // required this.price,
      required this.rearBreaks,
      required this.sales,
      required this.tireSize,
      required this.topSpeed,
      required this.torque,
      required this.unladenWeight,
      required this.updatedAt,
      required this.wheelBase,
      required this.yearsOfProduction,
      required this.listImage,
      required this.avgPrice,
      required this.dealerShips});

  factory CarModel.fromJson(Map<String, dynamic> jsonData) {
    return CarModel(
      carColors: jsonData['colors'] ?? [],
      img: ImageCar.fromJson(jsonData['image']).primary ?? 'Unknown',
      listImage: ImageCar.fromJson(jsonData['image']).secondary ?? [''],
      name: jsonData['name'] ?? 'Unknown',
      length: jsonData['length'] ?? 'Unknown',
      width: jsonData['width'] ?? 'Unknown',
      height: jsonData['height'] ?? 'Unknown',
      // img: jsonData['image'] ?? '',
      id: jsonData['_id'] ?? 'Unknown',
      acceleration: jsonData["acceleration"] ?? 'Unknown',
      aerodynamics: jsonData["aerodynamics"] ?? 'Unknown',
      bodyType: jsonData['bodyType'] ?? 'Unknown',
      brandId: jsonData['brandId'] ?? 'Unknown',
      cargoVolume: jsonData['cargoVolume'] ?? 'Unknown',
      cityFuelConsumption: jsonData['cityFuelConsumption'] ?? 'Unknown',
      clyinders: jsonData['clyinders'] ?? 'Unknown',
      co2Emissions: jsonData['co2Emissions'] ?? 'Unknown',
      createdAt: jsonData['createdAt'] ?? 'Unknown',
      displacement: jsonData['displacement'] ?? 'Unknown',
      driveType: jsonData['driveType'] ?? 'Unknown',
      frontBreaks: jsonData['frontBreaks'] ?? 'Unknown',
      frontRearTrack: jsonData['frontRearTrack'] ?? 'Unknown',
      fuel: jsonData['fuel'] ?? 'Unknown',
      fuelCapacity: jsonData['fuelCapacity'] ?? 'Unknown',
      fullSystem: jsonData['fullSystem'] ?? 'Unknown',
      fuelConsumptionCombined: jsonData['FuelConsumptionCombined'] ?? 'Unknown',
      gearBox: jsonData['gearBox'] ?? 'Unknown',
      grossWeightLimit: jsonData['grossWeightLimit'] ?? 'Unknown',
      groundClearance: jsonData['groundClearance'] ?? 'Unknown',
      highwayFuelConsumption: jsonData['highwayFuelConsumption'] ?? 'Unknown',
      power: jsonData['power'] ?? 'Unknown',
      rearBreaks: jsonData['rearBreaks'] ?? 'Unknown',
      sales: jsonData['sales'] ?? 0,
      tireSize: jsonData['tireSize'] ?? 'Unknown',
      topSpeed: jsonData['topSpeed'] ?? 'Unknown',
      torque: jsonData['torque'] ?? 'Unknown',
      unladenWeight: jsonData['unladenWeight'] ?? 'Unknown',
      updatedAt: jsonData['updatedAt'] ?? 'Unknown',
      wheelBase: jsonData['wheelBase'] ?? 'Unknown',
      yearsOfProduction: jsonData['yearsOfProduction'].cast<int>() ?? [],
      avgPrice: jsonData['avgPrice'] ?? 0,
      dealerShips: (jsonData['dealerShips'] as List<dynamic>?)
              ?.map((dealerShip) => DealerShips.fromJson(dealerShip))
              .toList() ??
          [],
    );
  }
}

class ImageCar {
  String? primary;
  List<dynamic>? secondary;

  ImageCar({this.primary, this.secondary});

  ImageCar.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'] ?? [''];
  }
}

class DealerShips {
  String? dealerShipName;
  String? dealerShipPhone;
  int? dealerShipPrice;
  String? dealerShipSId;
  String? dealerShipID;
  bool? fullOption;
  int? stock;

  DealerShips(
      {this.dealerShipName,
      this.dealerShipPhone,
      this.dealerShipPrice,
      this.dealerShipSId,
      this.fullOption,
      this.stock,
      this.dealerShipID});

  DealerShips.fromJson(Map<String, dynamic> json) {
    dealerShipName = json['name'];
    dealerShipPhone = json['phone'];
    dealerShipPrice = json['price'];
    dealerShipSId = json['_id'];
    dealerShipID = json['id'];
    fullOption = json['isFullOption'];
    stock = json['stock'];
  }
}

// class CarModel {
//   String id;
//   String name;
//   String img;
//   final String brandId;
//   int sales;
//   String bodyType;
//   String clyinders;
//   String displacement;
//   String power;
//   String torque;
//   String fullSystem;
//   String fuel;
//   String fuelCapacity;
//   String topSpeed;
//   String acceleration;
//   String driveType;
//   String gearBox;
//   String tireSize;
//   String length;
//   String width;
//   String height;
//   String frontRearTrack;
//   String wheelBase;
//   String groundClearance;
//   String cargoVolume;
//   String aerodynamics;
//   String unladenWeight;
//   String grossWeightLimit;
//   String cityFuelConsumption;
//   String highwayFuelConsumption;
//   String FuelConsumptionCombined;
//   String co2Emissions;
//   List<int> yearsOfProduction;
//   String frontBreaks;
//   String rearBreaks;
//   String createdAt;
//   String updatedAt;
//   List<DealerShips>? dealerShips;
//   int? avgPrice;
//   List<String>? listImage;
//
//   CarModel({
//     required this.name,
//     required this.length,
//     required this.width,
//     required this.height,
//     required this.img,
//     required this.id,
//     required this.acceleration,
//     required this.aerodynamics,
//     required this.bodyType,
//     required this.brandId,
//     required this.cargoVolume,
//     required this.cityFuelConsumption,
//     required this.clyinders,
//     required this.co2Emissions,
//     required this.createdAt,
//     required this.displacement,
//     required this.driveType,
//     required this.frontBreaks,
//     required this.frontRearTrack,
//     required this.fuel,
//     required this.fuelCapacity,
//     required this.fullSystem,
//     required this.FuelConsumptionCombined,
//     required this.gearBox,
//     required this.grossWeightLimit,
//     required this.groundClearance,
//     required this.highwayFuelConsumption,
//     required this.power,
//     required this.rearBreaks,
//     required this.sales,
//     required this.tireSize,
//     required this.topSpeed,
//     required this.torque,
//     required this.unladenWeight,
//     required this.updatedAt,
//     required this.wheelBase,
//     required this.yearsOfProduction,
//     required this.listImage,
//     required this.avgPrice,
//     required this.dealerShips,
//   });
//
//   factory CarModel.fromJson(Map<String, dynamic> jsonData) {
//     return CarModel(
//       img: ImageCar.fromJson(jsonData['image']).primary ?? '',
//       listImage:
//           ImageCar.fromJson(jsonData['image']).secondary?.cast<String>() ??
//               [''],
//       name: jsonData['name'] ?? '',
//       length: jsonData['length'] ?? '',
//       width: jsonData['width'] ?? '',
//       height: jsonData['height'] ?? '',
//       id: jsonData['_id'],
//       acceleration: jsonData["acceleration"] ?? '',
//       aerodynamics: jsonData["aerodynamics"] ?? '',
//       bodyType: jsonData['bodyType'] ?? '',
//       brandId: jsonData['brandId'] ?? '',
//       cargoVolume: jsonData['cargoVolume'] ?? '',
//       cityFuelConsumption: jsonData['cityFuelConsumption'] ?? '',
//       clyinders: jsonData['clyinders'] ?? '',
//       co2Emissions: jsonData['co2Emissions'] ?? '',
//       createdAt: jsonData['createdAt'] ?? '',
//       displacement: jsonData['displacement'] ?? '',
//       driveType: jsonData['driveType'] ?? '',
//       frontBreaks: jsonData['frontBreaks'] ?? '',
//       frontRearTrack: jsonData['frontRearTrack'] ?? '',
//       fuel: jsonData['fuel'] ?? '',
//       fuelCapacity: jsonData['fuelCapacity'] ?? '',
//       fullSystem: jsonData['fullSystem'] ?? '',
//       FuelConsumptionCombined: jsonData['FuelConsumptionCombined'] ?? '',
//       gearBox: jsonData['gearBox'] ?? '',
//       grossWeightLimit: jsonData['grossWeightLimit'] ?? '',
//       groundClearance: jsonData['groundClearance'] ?? '',
//       highwayFuelConsumption: jsonData['highwayFuelConsumption'] ?? '',
//       power: jsonData['power'] ?? '',
//       rearBreaks: jsonData['rearBreaks'] ?? '',
//       sales: jsonData['sales'] ?? 0,
//       tireSize: jsonData['tireSize'] ?? '',
//       topSpeed: jsonData['topSpeed'] ?? 'Unknown',
//       torque: jsonData['torque'] ?? '',
//       unladenWeight: jsonData['unladenWeight'] ?? '',
//       updatedAt: jsonData['updatedAt'] ?? '',
//       wheelBase: jsonData['wheelBase'] ?? '',
//       yearsOfProduction: jsonData['yearsOfProduction'].cast<int>(),
//       avgPrice: jsonData['avgPrice'],
//       dealerShips: (jsonData['dealerShips'] as List<dynamic>?)
//           ?.map((dealerShip) => DealerShips.fromJson(dealerShip))
//           .toList(),
//     );
//   }
// }
