import 'dart:convert';
import 'package:blog_app/utils/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UpdateApiServices with ChangeNotifier {
  bool isLoading = false;
  String? errorMessage;
  String? token;
  final box = GetStorage();

  Future<bool> fetchUpdate(String name, String phone) async {
    isLoading = true;
    notifyListeners();

    token = box.read('isLoggedIn');

    final uri = Uri.parse(
      "https://api.zhndev.site/wp-json/blog-app/v1/user/profile",
    );

    try {
      final response = await http.put(
        uri,
        body: jsonEncode({'name': name, 'phone': phone}),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = "Profile Update Failed";
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> fetchChangePass(String oldPass, String newPass) async {
    isLoading = true;

    notifyListeners();

    token = box.read('isLoggedIn');

    final uri = Uri.parse(
      "https://api.zhndev.site/wp-json/blog-app/v1/user/change-password",
    );

    try {
      final response = await http.post(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'current_password': oldPass,
          'new_password': newPass,
        }),
      );

      if (response.statusCode == 200) {
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = "Password update failed";
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
