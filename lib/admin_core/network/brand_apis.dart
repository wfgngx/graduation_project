import 'dart:convert';
import 'dart:io';
import 'package:graduation_project/model/brand_model.dart';
import 'package:graduation_project/utils/strings.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class BrandApiAdmin {
  Future<List<BrandModel>> getAllBrands() async {
    http.Response response = await http.get(
        // Uri.parse("$allBrands&offset=$offset&limit=$limit"),
        Uri.parse("$allBrands"),
        headers: requestHeaders);
    List<BrandModel> myBrands = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> brandData = jsonDecode(response.body);
      List<dynamic> allBrands = brandData['result'];
      for (int i = 0; i < allBrands.length; i++) {
        myBrands.add(BrandModel.fromJson(allBrands[i]));
        // print(response.body);
      }
    } else {
      throw Exception(response.statusCode);
    }
    return myBrands;
  }

  Future<String> addBrand({
    required String name,
    required String country,
    required File? image,
  }) async {
    var url = "https://carify-iota.vercel.app/brand/";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(requestHeaders);

    request.fields['name'] = name;
    request.fields['country'] = country;
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

  Future<String> editBrand(
      {required String name,
      required String country,
      required File? image,
      required String id}) async {
    var url = "https://carify-iota.vercel.app/brand/$id";
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.headers.addAll(requestHeaders);
    request.fields['name'] = name;
    request.fields['country'] = country;
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

  Future<http.Response> deleteBrand(String id) async {
    http.Response response = await http.delete(
        Uri.parse("https://carify-iota.vercel.app/brand/$id"),
        headers: requestHeaders);

    return response;
  }
}
// Future<Map<String, dynamic>> addBrand(Map<String, dynamic> newBrand) async {
//   try {
//     // String requestBody = jsonEncode(newBrand);
//     http.Response response = await http.post(
//         Uri.parse("https://carify-iota.vercel.app/brand/"),
//        // body: requestBody,
//         body: Formd,
//         headers: {
//           'Content-Type': 'application/json',
//           'token':
//               'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1lZG8xMjMuYmFrZWVyQGdtYWlsLmNvbSIsImlkIjoiNjU2N2QyODZhODU0OGNmNmIyOTAxYmJlIiwicm9sZSI6ImFkbWluIiwiaWF0IjoxNzAxOTIyMTc0fQ.UQpbRA7gSn0Abj-gLT6Qr3bhowecsyD1HmREncRfzuc'
//         });
//     Map<String, dynamic> responseBody = jsonDecode(response.body);
//    // print(requestBody);
//     print(responseBody);
//     return responseBody;
//   } catch (e) {
//     throw e;
//   }
// }
// Future<String> addBrand({
//   required String name,
//   required String country,
//   required File? image,
//   // required String accessToken,
// }) async {
//   var url = "https://carify-iota.vercel.app/brand/ocr";
//
//   var bytes = image?.readAsBytesSync();
//
//   var response = await http.post(Uri.parse(url),
//       headers: requestHeaders,
//       body: {"image": bytes, "name": name, "country": country},
//       encoding: Encoding.getByName("utf-8"));
//   print(response.body);
//   return response.body;
//   // http.Response response =await http.post(Uri.parse(url),headers:requestHeaders);
//   // final uri = Uri.parse('https://carify-iota.vercel.app/brand/');
//   // var request = http.MultipartRequest(
//   //   'POST',
//   //   uri,
//   // );
//
//   // request.headers.addAll(requestHeaders);
//   // //request.headers['token'] = accessToken;
//   // request.fields['name'] = name;
//   // request.fields['country'] = country;
//   // request.fields['image'] = bytes;
//
//   // if (image != null) {
//   //   request.files.add(await http.MultipartFile.fromPath(
//   //     'image',
//   //     image.path,
//   //   ));
//   //   print(image);
//   // }
//   // print(request);
//   // try {
//   //   var response = await request.send();
//   //   print('Response Status Code: ${response.statusCode}');
//   //   print('Response Reason Phrase: ${response.reasonPhrase}');
//   //   print('Response Body: ${await response.stream.bytesToString()}');
//   //
//   //   if (response.statusCode == 200) {
//   //     print('Brand added successfully');
//   //   } else {
//   //     print('Error adding brand: ${response.reasonPhrase}');
//   //   }
//   // } catch (error) {
//   //   print('Error: $error');
//   // }
// }

// Future<Map<String, dynamic>> editBrand(
//     Map<String, dynamic> afterEditBrand, String id) async {
//   try {
//     String encodedMapEdit = jsonEncode(afterEditBrand);
//     http.Response response = await http.patch(
//         Uri.parse("https://carify-iota.vercel.app/brand/$id"),
//         body: encodedMapEdit,
//         headers: requestHeaders);
//     Map<String, dynamic> newBrand = jsonDecode(response.body);
//     print(encodedMapEdit);
//     print(newBrand);
//     return newBrand;
//   } catch (e) {
//     rethrow;
//   }
// }
