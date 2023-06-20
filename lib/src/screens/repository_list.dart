import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/repository_list_controller.dart';

class RepositoryList extends StatelessWidget {
  final RepositoryListController controller =
      Get.put(RepositoryListController());

  RepositoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('1'),
            );
          }),
    );
  }
}
