import 'dart:convert';

import 'package:graduation_project/model/car_model.dart';
import 'package:graduation_project/utils/strings.dart';
import 'package:http/http.dart' as http;

class CarApi {
  Future<List<CarModel>> fetchCars(
      {String sort = "price",
      String brand = "NISSAN",
      required int offset,
      required int limit}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://carify-iota.vercel.app/car?sort=$sort&brandName=$brand&offset=$offset&limit=$limit"),
        headers: requestHeaders);
    //'https://carify-iota.vercel.app/car?sort=$sort&brandName=$brand'),headers: requestHeaders);
    List<CarModel> myCars = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> allCarsData = data['result'];
      for (int i = 0; i < allCarsData.length; i++) {
        myCars.add(CarModel.fromJson(allCarsData[i]));
        //   print(myCars);
      }
    } else {
      throw Exception(response.statusCode);
    }
    return myCars;
  }
}
// https://carify-iota.vercel.app/car?sort=price&brandName=CHEVROLET
