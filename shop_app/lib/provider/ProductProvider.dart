import 'dart:convert';
import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

import '../models/Product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> listProduct = [];

  void getListProduct() async {
    String urlApi = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      listProduct =
          data.map<Product>((json) => Product.fromJson(json)).toList();
      notifyListeners();
    }
  }
}
