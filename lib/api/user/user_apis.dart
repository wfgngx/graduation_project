import 'dart:convert';
import 'dart:io';
import 'package:graduation_project/model/user_cars.dart';
import 'package:http/http.dart' as http;
import '../../utils/strings.dart';
import 'package:http_parser/http_parser.dart';

class UserApis {
  Future<String> addCar(
      {required String carModel,
      required String userPhone,
      required String type,
      required String carBrandName,
      required String modelYear,
      required String carPrice,
      required String carDistance,
      required String carTransmission,
      required String carDuration,
      required String carFuel,
      required String carCity,
      required String carLocation,
      required String carDescription,
      required List<File>? image,
      required String token}) async {
    var url = "https://carify-iota.vercel.app/used-car/";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers
        .addAll({'Content-Type': 'multipart/form-data', 'token': token});
    request.fields['name'] = carModel;
    request.fields['brand'] = carBrandName;
    request.fields['year'] = modelYear;
    request.fields['price'] = carPrice;
    request.fields['distance'] = carDistance;
    request.fields['transmission'] = carTransmission;
    request.fields['duration'] = carDuration;
    request.fields['fuel'] = carFuel;
    request.fields['city'] = carCity;
    request.fields['location'] = carLocation;
    request.fields['description'] = carDescription;
    request.fields['phone'] = userPhone;
    request.fields['type'] = type;
    if (image != null) {
      for (var i = 0; i < image.length; i++) {
        var stream = http.ByteStream(image[i].openRead());
        var length = await image[i].length();
        var multipartFile = http.MultipartFile('images', stream, length,
            filename: image[i].path.split("/").last,
            contentType: MediaType('image', 'jpeg'));
        request.files.add(multipartFile);
      }

      print(image);
    }
    var response = await http.Response.fromStream(await request.send());
    print(jsonDecode(response.body));
    return response.body;
  }

  Future<List<UserCars>> getCars(String token) async {
    http.Response response = await http.get(
        Uri.parse("https://carify-iota.vercel.app/used-car?type=sell"),
        headers: {'Content-Type': 'application/json', 'token': token});
    List<UserCars> myCars = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> allCarsData = data['cars'];
      for (int i = 0; i < allCarsData.length; i++) {
        myCars.add(UserCars.fromJson(allCarsData[i]));
        print(myCars);
      }
    } else {
      throw Exception(response.statusCode);
    }
    return myCars;
  }
  Future<List<UserCars>> getRentCars(String token) async {
    http.Response response = await http.get(
        Uri.parse("https://carify-iota.vercel.app/used-car?type=rent"),
        headers: {'Content-Type': 'application/json', 'token': token});
    List<UserCars> myCars = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> allCarsData = data['cars'];
      for (int i = 0; i < allCarsData.length; i++) {
        myCars.add(UserCars.fromJson(allCarsData[i]));
        print(myCars);
      }
    } else {
      throw Exception(response.statusCode);
    }
    return myCars;
  }

  Future<String> deleteCar(String id, String token) async {
    http.Response response = await http.delete(
        Uri.parse("https://carify-iota.vercel.app/used-car/$id"),
        headers: {'token': token});
    // if (response.statusCode == 200) {
    //   return response.body;
    // }

    print(response.body);
    return response.body;
  }

  Future<List<UserCars>> getPrivateCars(String token) async {
    http.Response response = await http.get(
        Uri.parse("https://carify-iota.vercel.app/auth/used-car/"),
        headers: {'Content-Type': 'application/json', 'token': token});
    List<UserCars> myCars = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> allCarsData = data['result'];
      for (int i = 0; i < allCarsData.length; i++) {
        myCars.add(UserCars.fromJson(allCarsData[i]));
        print(myCars);
      }
    } else {
      throw Exception(response.statusCode);
    }
    return myCars;
  }

  Future<String> editCarUser(
      {required String token,
      required String carModel,
      required String userPhone,
      required String type,
      required String carBrandName,
      required String modelYear,
      required String carPrice,
      required String carDistance,
      required String carTransmission,
      required String carDuration,
      required String carFuel,
      required String carCity,
      required String carLocation,
      required String carDescription,
      required List<File>? image,
      required String id}) async {
    var url = "https://carify-iota.vercel.app/used-car/$id";
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.headers
        .addAll({'Content-Type': 'multipart/form-data', 'token': token});
    request.fields['name'] = carModel;
    request.fields['brand'] = carBrandName;
    request.fields['year'] = modelYear;
    request.fields['price'] = carPrice;
    request.fields['distance'] = carDistance;
    request.fields['transmission'] = carTransmission;
    request.fields['duration'] = carDuration;
    request.fields['fuel'] = carFuel;
    request.fields['city'] = carCity;
    request.fields['location'] = carLocation;
    request.fields['description'] = carDescription;
    request.fields['phone'] = userPhone;
    request.fields['type'] = type;
    if (image != null) {
      for (var i = 0; i < image.length; i++) {
        var stream = http.ByteStream(image[i].openRead());
        var length = await image[i].length();
        var multipartFile = http.MultipartFile('images', stream, length,
            filename: image[i].path.split("/").last,
            contentType: MediaType('image', 'jpeg'));
        request.files.add(multipartFile);
      }

      print(image);
    }
    var response = await http.Response.fromStream(await request.send());
    print(response.body);
    return response.body;
  }
}
