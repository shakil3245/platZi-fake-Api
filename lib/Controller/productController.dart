import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import '../Model/productModel.dart';
class ProductController extends GetxController{
  List <ProductModel> postList = [];
  Future<List<ProductModel>> getPostAPI() async {
    final response = await https.get(Uri.parse("https://api.escuelajs.co/api/v1/products"));
    log(response.statusCode.toString());
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(ProductModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
}