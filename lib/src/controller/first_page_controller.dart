import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/model/user_details.dart';

class FirstPageController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  late TabController tabController;

  final userDetailsList = <UserDetails>[].obs;
  bool isLoading = true;
  var isError = false;

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
      isError = true;
      throw Exception('User information not found');
    }
  }
}
