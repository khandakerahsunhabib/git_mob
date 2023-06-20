import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/first_page_controller.dart';
import 'package:git_mob/src/controller/repository_list_controller.dart';
import 'package:git_mob/src/screens/home_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final FirstPageController _controller = Get.put(FirstPageController());
  final RepositoryListController controller =
      Get.put(RepositoryListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Git Mob'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5)),
              width: double.infinity,
              height: 50,
              child: TextFormField(
                controller: _controller.userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Github username',
                    prefixIcon: Icon(Icons.supervisor_account),
                    focusColor: Colors.amber),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Container(
              width: 130,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    _controller.getUserData(_controller.userNameController.text
                        .toString()
                        .toLowerCase());
                    controller.getUserRepositoryList(_controller
                        .userNameController.text
                        .toString()
                        .toLowerCase());
                    Get.to(() => HomePage());
                  },
                  child: const Text('SEARCH USER')),
            )
          ],
        ),
      ),
    );
  }
}
