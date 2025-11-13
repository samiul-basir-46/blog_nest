import 'dart:convert';

import 'package:blog_app/model/get_blog_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/api_url.dart';

class GetPost extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;
  List<GetBlogModel> blogs = [];

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future fetchPost() async {
    print("fetchPost called ✅");
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse(ApiUrl.postUrl);
    print("🌐 API URL: ${ApiUrl.postUrl}");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        print("✅ Full Response: ${response.body}");
        final List data = decodedJson['data']['posts'] as List;
        print("✅ Posts Found: ${data.length}");
        blogs = data.map((e) => GetBlogModel.fromJson(e)).toList();
        print("✅ Parsed blogs: ${blogs.length}");
        _isLoading = false;
        notifyListeners();
        return blogs;
      } else {
        _errorMessage = "Something went wrong";
      }
    } catch (e) {
      _errorMessage = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
