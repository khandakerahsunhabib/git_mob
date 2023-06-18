import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/model/user_details.dart';

class FirstPageController extends GetxController {
  TextEditingController userNameController = TextEditingController();

  final userDetailsList = <UserDetails>[].obs;

  Future<UserDetails> getUserData(String username) async {
    final url = 'https://api.github.com/users/$username';
    final dio = Dio();
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final responseData = json.encode(response.data);
      final jsonData = json.decode(responseData);
      UserDetails userDetails = UserDetails.fromJson(jsonData);
      userDetailsList.add(userDetails);
      //print('userDetails return:${userDetails.toJson()}');
      return userDetails;
    } else {
      throw Exception('Failed to load user information');
    }
  }
}
