import 'dart:convert';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:graduation_project/utils/strings.dart';
import 'package:http/http.dart' as http;

import '../../model/user_info.dart';

class ApiAuth {
  Future<Map<String, dynamic>> createUserAccount(
    Map<String, dynamic> userData,
  ) async {
    try {
      String requestBody = jsonEncode(userData);
      http.Response response = await http.post(
          Uri.parse('https://carify-iota.vercel.app/auth/sign-up'),
          body: requestBody,
          headers: {'Content-Type': 'application/json'});
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(requestBody);
      print(responseBody);
      return responseBody;
      // dynamic responseBody = jsonDecode(response.body);
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>> logIn(Map<String, dynamic> userData) async {
    try {
      String requestBody = jsonEncode(userData);
      http.Response response = await http.post(
          Uri.parse('https://carify-iota.vercel.app/auth/login'),
          body: requestBody,
          headers: {'Content-Type': 'application/json'});
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(requestBody);
      print(responseBody);
      return responseBody;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> forgotPasswordGetCode(
      String email, String token) async {
    String encodedEmail = json.encode({"email": email});
    http.Response response = await http.patch(
        Uri.parse('https://carify-iota.vercel.app/auth/forgot-password'),
        body: encodedEmail,
        headers: {'Content-Type': 'application/json', 'token': token});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      print(encodedEmail);

      return jsonDecode(response.body);
    } else {
      print(response.reasonPhrase);
    }
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> verifyCode(String email, String password,
      String code, String rePassword, String token) async {
    String encodedData = json.encode({
      "email": email,
      "password": password,
      "cPassword": rePassword,
      "forgetCode": code
    });
    // var headers = {'Content-Type': 'application/json'};
    // var request = http.Request('PATCH',
    //     Uri.parse('https://carify-iota.vercel.app/auth/reset-password'));
    http.Response response = await http.patch(
        Uri.parse('https://carify-iota.vercel.app/auth/reset-password'),
        body: encodedData,
        headers: {'Content-Type': 'application/json', 'token': token});

    if (response.statusCode == 200) {
    } else {
      print(response.reasonPhrase);
    }

    print(response.body);
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> editProfilePic(
      {required File? image, required String token}) async {
    var url = "https://carify-iota.vercel.app/auth/profile-picture";
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.headers
        .addAll({'Content-Type': 'multipart/form-data', 'token': token});
    if (image != null) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile('pp', stream, length,
          filename: image.path.split("/").last,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      print(image);
    }
    var response = await http.Response.fromStream(await request.send());
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  Map<String, String> requestHeaders = {
    'Content-Type': 'multipart/form-data',
    'token':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImhoZmpmamZqMzVAZ21haWwuY29tIiwiaWQiOiI2NTZkNDQ1NzAzNjJlZmI1YzA1MmYzNWQiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDMxMTM4NTh9.TTt8sqJEE9JH8ycHwEA_Qy3lV_TbmwV9TSVU14jmolc'
  };
  Future<Map<String, dynamic>> getUserData(String token) async {
    http.Response response = await http.get(
        Uri.parse('https://carify-iota.vercel.app/auth/profile'),
        headers: {'Content-Type': 'application/json', 'token': token});
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
    } else {
      throw response.statusCode;
    }
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> changeUserName(
      String fName, String lName, String token) async {
    var request = http.Request('PATCH',
        Uri.parse('https://carify-iota.vercel.app/auth/account-details'));
    request.body = json.encode({"firstName": fName, "lastName": lName});
    request.headers
        .addAll({'Content-Type': 'application/json', 'token': token});

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
    return jsonDecode(request.body);
  }
}
