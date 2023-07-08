import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/repository_list_controller.dart';

class RepositoryDetails extends StatelessWidget {
  RepositoryDetails({super.key});

  final RepositoryListController controller =
      Get.put(RepositoryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repository Details'),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Obx(() => Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        'Repo Name-',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      controller
                          .repoList[controller.selectedItemIndex.value].reponame
                          .toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 5)),
                    SizedBox(
                      child: Text(
                        'Description - ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      controller.repoList[controller.selectedItemIndex.value]
                          .description
                          .toString(),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 8)),
                    SizedBox(
                      child: Text(
                        'Created Date - ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(controller.repoList[controller.selectedItemIndex.value]
                        .createddate
                        .toString()
                        .substring(0, 10)),
                    const Padding(padding: EdgeInsets.only(bottom: 8)),
                    SizedBox(
                      child: Text(
                        'Visibility - ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(controller
                        .repoList[controller.selectedItemIndex.value].visibility
                        .toString()),
                    const Padding(padding: EdgeInsets.only(bottom: 8)),
                    SizedBox(
                      child: Text(
                        'Branch Name - ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Text(controller
                        .repoList[controller.selectedItemIndex.value].branch
                        .toString()),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
