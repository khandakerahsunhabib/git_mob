import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/repository_list_controller.dart';
import '../model/repository_list.dart';

class RepositoryList extends StatefulWidget {
  const RepositoryList({super.key});

  @override
  State<RepositoryList> createState() => _RepositoryListState();
}

class _RepositoryListState extends State<RepositoryList> {
  late Future<All> futureRepo;
  final RepositoryListController controller =
      Get.put(RepositoryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(
      () {
        if (controller.repoList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.repoList.length,
            itemBuilder: (context, index) {
              return repoTile(controller, index);
            },
          );
        }
      },
    ));
  }

  Widget repoTile(controller, index) {
    final repository = controller.repoList[index];
    return Wrap(
      children: [
        ListTile(
          title: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    repository.reponame.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 25,
                  decoration: BoxDecoration(
                      //color: Colors.green,
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    repository.branch.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
