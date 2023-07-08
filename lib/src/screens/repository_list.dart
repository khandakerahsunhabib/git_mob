import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/repository_list_controller.dart';
import 'package:git_mob/src/screens/repository_details.dart';

class RepositoryList extends StatefulWidget {
  const RepositoryList({super.key});

  @override
  State<RepositoryList> createState() => _RepositoryListState();
}

class _RepositoryListState extends State<RepositoryList> {
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
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: ListTile(
        minVerticalPadding: 5,
        trailing: IconButton(
            onPressed: () {
              controller.selectedItemIndex.value=index;
              Get.to(()=>RepositoryDetails());
            },
            icon: const Icon(Icons.arrow_circle_right_outlined)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  repository.reponame.toString(),
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: true,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 18,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                repository.branch.toString(),
                style: Theme.of(context).textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            )
          ],
        ),
        subtitle: Row(
          children: [
            Flexible(
              child: Text(
                'Lang: ${repository.language.toString()}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Created: ${repository.createddate.toString().substring(0, 10)}',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}
