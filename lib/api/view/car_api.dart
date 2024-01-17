import 'dart:convert';
import 'package:graduation_project/model/car_model.dart';
import 'package:http/http.dart' as http;

class CarApi {
  Future<List<CarModel>> fetchFavorites({
    required String token,
  }) async {
    http.Response response = await http.get(
        Uri.parse("https://carify-iota.vercel.app/favorite"),
        headers: {'token': token});
    List<CarModel> myCars = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      List<dynamic> allCarsData = data['result'];
      for (int i = 0; i < allCarsData.length; i++) {
        myCars.add(CarModel.fromJson(allCarsData[i]));
        //   print(myCars);
      }
    } else {
      throw Exception(response.statusCode);
    }
    print('object$myCars');
    return myCars;
  }

  Future<List<CarModel>> fetchCars(
      {String sort = "price",
      String brand = "NISSAN",
      required String token,
      required int offset,
      required int limit}) async {
    http.Response response = await http.get(
        Uri.parse(
            "https://carify-iota.vercel.app/car?sort=$sort&brandName=$brand&offset=$offset&limit=$limit"),
        headers: {'Content-Type': 'multipart/form-data', 'token': token});
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

  Future<List<CarModel>> fetchSearchCars(
      {required String token,
      required String search,
      String brandName = ''}) async {
    try {
      final url = Uri.parse(
          "https://carify-iota.vercel.app/car?search=$search&brandName=$brandName");
      final response = await http.get(url, headers: {'token': token});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> allCarsData = data['result'];
        final List<CarModel> myCars =
            allCarsData.map((carData) => CarModel.fromJson(carData)).toList();

        return myCars;
      } else {
        print("Error in fetchSearchCars: ${response.statusCode}");
        // Print the response body for more details (remove in production)
        print("Response body: ${response.body}");
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error in fetchSearchCars: $e");
      throw e;
    }
  }

  // Future<List<CarModel>> fetchSearchCars(
  //     {required String token,
  //     String sort = "price",
  //     String brand = "NISSAN",
  //     required String search}) async {
  //   http.Response response = await http.get(
  //       Uri.parse(
  //           "https://carify-iota.vercel.app/car?sort=$sort&brandName=$brand&search=$search"),
  //       headers: {'token': token});
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
  Future<List<CarModel>> fetchSearchSpecialCar({
    required String token,
    required String search,
    required String brandName,
  }) async {
    try {
      final url = Uri.parse(
          "https://carify-iota.vercel.app/car?search=$search&brandName=$brandName");
      final response = await http.get(url, headers: {'token': token});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> allCarsData = data['result'];
        final List<CarModel> myCars =
            allCarsData.map((carData) => CarModel.fromJson(carData)).toList();

        return myCars;
      } else {
        print("Error in fetchSearchCars: ${response.statusCode}");
        // Print the response body for more details (remove in production)
        print("Response body: ${response.body}");
        throw Exception("Failed to load data");
      }
    } catch (e) {
      print("Error in fetchSearchCars: $e");
      throw e;
    }
  }

  Future<String> addFavoriteCar(String id, String token) async {
    var headers = {'token': token};
    var request = http.Request(
        'POST', Uri.parse('https://carify-iota.vercel.app/favorite/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return request.body;
  }

  Future<String> deleteFavoriteCar(String id, String token) async {
    var headers = {'token': token};
    var request = http.Request(
        'DELETE', Uri.parse('https://carify-iota.vercel.app/favorite/$id'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return request.body;
  }
}
// https://carify-iota.vercel.app/car?sort=price&brandName=CHEVROLET
