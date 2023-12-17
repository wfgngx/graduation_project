import 'dart:convert';

import 'package:graduation_project/model/brand_model.dart';
import 'package:graduation_project/utils/strings.dart';
import 'package:http/http.dart' as http;

class BrandApi {
  Future<List<BrandModel>> getAllBrands() async {
    http.Response response = await http.get(Uri.parse(allBrands),headers: requestHeaders);
    List<BrandModel> myBrands = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> brandData = jsonDecode(response.body);
      List<dynamic> allBrands = brandData['result'];
      for (int i = 0; i < allBrands.length; i++) {
        myBrands.add(BrandModel.fromJson(allBrands[i]));
      //  print(myBrands);
      }
    } else {
      throw Exception(response.statusCode);
    }
    return myBrands;
  }
}
