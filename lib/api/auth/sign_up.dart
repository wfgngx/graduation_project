import 'dart:convert';

import 'package:graduation_project/utils/strings.dart';
import 'package:http/http.dart' as http;

class ApiAuth {
  Future<Map<String, dynamic>> createUserAccount(
    Map<String, dynamic> userData,
  ) async {
    try {
      String requestBody = jsonEncode(userData);
      http.Response response = await http.post(
          Uri.parse('https://carify-iota.vercel.app/auth/sign-up'),
          body: requestBody,
          headers: requestHeaders);
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
          headers: requestHeaders);
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(requestBody);
      print(responseBody);
      return responseBody;
    } catch (e) {
      throw e;
    }
  }
  // Future<http.Response> login() async {
  //   //IMPLEMENT USER LOGIN
  // }
  //
  // Future<http.Response> getUserProfileData() async {
  //   //GET USER PROFILE DATA
  // }
  //
  // Future<http.Response> logout() async {
  //   //IMPLEMENT USER LOGOUT
  // }
}
