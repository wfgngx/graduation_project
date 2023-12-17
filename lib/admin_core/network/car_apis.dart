import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../utils/strings.dart';
import 'package:http_parser/http_parser.dart';

class AdminCarsApi {
  Future<http.Response> deleteCar(String id) async {
    http.Response response = await http.delete(
        Uri.parse("https://carify-iota.vercel.app/car/$id"),
        headers: requestHeaders);

    return response;
  }

  Future<String> editCar(
      {required String name, required String price, required String id}) async {
    var url = "https://carify-iota.vercel.app/car/$id";
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.headers.addAll(requestHeaders);
    request.fields['name'] = name;
    request.fields['price'] = price.toString();
    print(id);
    print(name);
    print(price);
    var response = await http.Response.fromStream(await request.send());
    print(jsonDecode(response.body));
    return response.body;
  }

  Future<String> addCar({
    required File? image,
    required String brandName,
    required String name,
    required String gearBox,
    required String bodyType,
    required String price,
    required String sales,
    required String driveType,
    required String topSpeed,
    required String acceleration,
    required String fuel,
    // required List<int> yearOfProduction,
  }) async {
    var url = "https://carify-iota.vercel.app/car/";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(requestHeaders);

    request.fields['name'] = name;
    request.fields['brandName'] = brandName;
    request.fields['gearBox'] = gearBox;
    request.fields['bodyType'] = bodyType;
    request.fields['price'] = price.toString();
    request.fields['sales'] = sales.toString();
    request.fields['driveType'] = driveType;
    request.fields['topSpeed'] = topSpeed;
    request.fields['acceleration'] = acceleration;
    request.fields['fuel'] = fuel;

    if (image != null) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: image.path.split("/").last,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      print(image);
    }
    var response = await http.Response.fromStream(await request.send());
    print(jsonDecode(response.body));
    return response.body;
  }
}
