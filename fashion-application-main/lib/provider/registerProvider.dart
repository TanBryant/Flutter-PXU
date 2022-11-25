import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider with ChangeNotifier {
  String baseUrl = "https://api.storerestapi.com/auth/register";
  bool isRegister = false;

  Future<void> register(
      String name, String email, String password, String passwordRepeat) async {
    var url = Uri.parse("${baseUrl}auth/register");
    var response = await http.post(url, body: {
      "name": name,
      "email": email,
      "password": password,
      "passwordRepeat": password,
    });

    if (response.statusCode == 200) {
      isRegister = true;
      notifyListeners();
    }
  }
}
