import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/repository_list.dart';

class RepositoryListController extends GetxController {
  final repoList = <RepositoryList>[].obs;

  Future<void> getUserRepositoryList(String username) async {
    final url = 'https://api.github.com/users/$username/repos';
    final dio = Dio();

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseData = response.data as List<dynamic>;
        final List<RepositoryList> fetchedRepositories =
            responseData.map((json) => RepositoryList.fromJson(json)).toList();
        repoList.assignAll(fetchedRepositories);
      } else {}
    } catch (e) {
      throw Exception('Failed to fetch repositories: $e');
    }
  }
}
