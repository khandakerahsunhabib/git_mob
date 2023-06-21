import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/app.dart';
import '../controller/first_page_controller.dart';
import '../widgets/all_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirstPageController _controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  MyApp.themeNotifier.value =
                      MyApp.themeNotifier.value == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                },
                icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode))
          ],
        ),
        drawer: const Drawer(),
        body: Obx(
          () => ListView.builder(
              itemCount: _controller.userDetailsList.length,
              itemBuilder: (context, index) {
                return userData(context, index);
              }),
        ));
  }

  Widget userData(context, index) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          profileSection(context, index),
          bioAndFollowersSection(context, index),
          buildTabBarRepositories(context, index),
        ],
      ),
    );
  }
}
