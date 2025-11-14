import 'dart:convert';

import 'package:blog_app/model/get_blog_model.dart';
import 'package:blog_app/model/profile_model.dart';
import 'package:blog_app/model/single_blog_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/api_url.dart';

class GetPost extends ChangeNotifier {
  bool _isLoading = false;
  bool isFetches = false;
  String? _errorMessage;
  String? name;
  String? email;
  String? phone;
  String? token;
  SingleBlogModel? singleBlog;
  final box = GetStorage();
  ProfileModel? profile;
  List<GetBlogModel> blogs = [];

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  Future fetchPost() async {
    if (isFetches) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse(ApiUrl.postUrl);

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final List data = decodedJson['data']['posts'] as List;
        blogs = data.map((e) => GetBlogModel.fromJson(e)).toList();
        _isLoading = false;
        notifyListeners();
        return blogs;
      } else {
        _errorMessage = "Something went wrong";
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future fetchProfile() async {
    _isLoading = true;
    if (isFetches) return;
    notifyListeners();
    final uri = Uri.parse(
      "https://api.zhndev.site/wp-json/blog-app/v1/user/profile",
    );

    token = box.read('isLoggedIn');

    try {
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        profile = ProfileModel.fromJson(decodedJson['data']['user']);
        name = decodedJson['data']['user']['name'];
        email = decodedJson['data']['user']['email'];
        phone = decodedJson['data']['user']['phone'];
        box.write('name', name);
        box.write('email', email);
        box.write('phone', phone);
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future fetchSingleBlog(int id) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse(
      "https://api.zhndev.site/wp-json/blog-app/v1/posts/$id",
    );

    try {
      final response = await http.get(url);
      print('Response: ${response.body}');
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final postJson = decodedJson['data']['post'];
        singleBlog = SingleBlogModel.fromJson(postJson);
        _isLoading = false;
        notifyListeners();
        return singleBlog;
      } else {
        _errorMessage = "Something went wrong!";
      }
    } catch (e) {
      _errorMessage = "Failed $e";
    }
    _isLoading = false;
    notifyListeners();
  }
}
