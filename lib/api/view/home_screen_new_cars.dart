import 'dart:convert';

import 'package:graduation_project/model/car_model.dart';
import 'package:http/http.dart' as http;

class NewCars {
  Future<List<CarModel>> fetchNewCars({
    required String token,
  }) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://carify-iota.vercel.app/car/newest?offset=0&limit=20"),
        headers: {'Content-Type': 'multipart/form-data', 'token': token});
    List<CarModel> myCars = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> allCarsData = data['result'];
      print(data);
      for (int i = 0; i < allCarsData.length; i++) {
        myCars.add(CarModel.fromJson(allCarsData[i]));
        print(myCars);
        //   print(myCars);
      }
    } else {
      throw Exception(response.statusCode);
    }
    print(myCars);
    return myCars;
  }

// Future<List<CarModel>> fetchNewCars(String token) async {
  //   http.Response response = await http.get(
  //       Uri.parse("https://carify-iota.vercel.app/car/newest"),
  //       headers: {'token': token});
  //   List<CarModel> myNewCars = [];
  //
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     print(data);
  //     List<dynamic> myCars = data['result'];
  //     for (int i = 0; i < myCars.length; i++) {
  //       myNewCars.add(CarModel.fromJson(myCars[i]));
  //     }
  //   } else {
  //     throw Exception(response.statusCode);
  //   }
  //   return myNewCars;
  // }
}
//
// Future<List<CarModel>> fetchCars(
//     {String sort = "price",
//     String brand = "NISSAN",
//     required String token,
//     required int offset,
//     required int limit}) async {
//   http.Response response = await http.get(
//       Uri.parse(
//           "https://carify-iota.vercel.app/car?sort=$sort&brandName=$brand&offset=$offset&limit=$limit"),
//       headers: {'Content-Type': 'multipart/form-data', 'token': token});
//   List<CarModel> myCars = [];
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = jsonDecode(response.body);
//     List<dynamic> allCarsData = data['result'];
//     for (int i = 0; i < allCarsData.length; i++) {
//       myCars.add(CarModel.fromJson(allCarsData[i]));
//       //   print(myCars);
//     }
//   } else {
//     throw Exception(response.statusCode);
//   }
//   return myCars;
// }
