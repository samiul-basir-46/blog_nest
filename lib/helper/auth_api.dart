import 'dart:convert';

import 'package:blog_app/utils/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthApiServices with ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  final box = GetStorage();

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future regFetch(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse(ApiUrl.regUrl);
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
          "phone": phone,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        _errorMessage = "Account Crated Successfully";
        return decodedJson;
      } else {
        _errorMessage = "Account Created Failed";
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future loginFetch(String email, String password) async {
    print("fetchPost called ");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse("https://api.zhndev.site/wp-json/blog-app/v1/auth/login");
    print("API URL: ${ApiUrl.postUrl}");

      final response = await http.post(
        url,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        final token = decodedJson['data']['token'];
        box.write('isLoggedIn', token);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = "Login Failed";
      }
    _isLoading = false;
    notifyListeners();
    return false;
  }

  bool get isLoggedIn {
    final tokenBox = box.read('isLoggedIn');
    return tokenBox != null;
  }

  String? get getToken => box.read('isLoggedIn');
}
