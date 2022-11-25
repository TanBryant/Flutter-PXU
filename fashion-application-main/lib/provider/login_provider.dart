import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider with ChangeNotifier {
  String baseUrl = "https://api.storerestapi.com/";
  bool isLogin = false;

  Future<void> login(String email, String password) async {
    var url = Uri.parse("${baseUrl}auth/login");
    var response = await http.post(url, body: {
      "email": email,
      "password": password,
    });
    if (response.statusCode == 200) {
      isLogin = true;
      notifyListeners();
    }
  }
}
