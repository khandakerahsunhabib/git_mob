import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/first_page_controller.dart';
import 'package:git_mob/src/screens/home_page.dart';
import '../settings/settings_view.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final FirstPageController _controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Git Mob'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(children: [
              const Text('Input your github username'),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _controller.userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              ElevatedButton(
                  onPressed: () {
                    _controller.getUserData(_controller.userNameController.text
                        .toString()
                        .toLowerCase());
                    Get.to(() => HomePage());
                  },
                  child: const Text('Submit'))
            ]),
          )
        ],
      ),
    );
  }
}
