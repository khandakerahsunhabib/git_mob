import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/repository_list.dart';

class RepositoryListController extends GetxController {
  final repo = <All>[].obs;

  Future<All> getUserRepositoryList(String username) async {
    final url = 'https://api.github.com/users/$username/repos';
    final dio = Dio();
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      print('response: ${response.data}');
      final responseData = json.encode(response.data);
      return All.fromJson(json.decode(responseData));
    } else {
      throw Exception('User information not found');
    }
  }
}
