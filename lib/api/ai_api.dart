import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AIApi {
  Future<Map<String, dynamic>> detectCar(
      {required File? image, required String token}) async {
    var url = "https://carify-iota.vercel.app/car/detect";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers
        .addAll({'Content-Type': 'multipart/form-data', 'token': token});
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
    return jsonDecode(response.body);
    // response.body;
  }
}

// Future<String> addBrand({
//   required String name,
//   required String country,
//   required File? image,
// }) async {
//   var url = "https://carify-iota.vercel.app/brand/";
//   var request = http.MultipartRequest('POST', Uri.parse(url));
//   request.headers.addAll(requestHeaders);
//
//   request.fields['name'] = name;
//   request.fields['country'] = country;
//   if (image != null) {
//     var stream = http.ByteStream(image.openRead());
//     var length = await image.length();
//     var multipartFile = http.MultipartFile('image', stream, length,
//         filename: image.path.split("/").last,
//         contentType: MediaType('image', 'jpeg'));
//     request.files.add(multipartFile);
//     print(image);
//   }
//   var response = await http.Response.fromStream(await request.send());
//   print(jsonDecode(response.body));
//   return response.body;
// }
