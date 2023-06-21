import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_mob/src/controller/first_page_controller.dart';
import 'package:git_mob/src/screens/repository_list.dart';

final FirstPageController _controller = Get.put(FirstPageController());
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

profileSection(context, index) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: NetworkImage(_controller
                        .userDetailsList[index].avatarUrl
                        .toString()))),
          ),
          SizedBox(
            //color: Colors.red,
            width: Get.width / 1.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _controller.userDetailsList[index].name.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 20, color: Colors.grey[500]),
                ),
                Text(
                  _controller.userDetailsList[index].login.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}

bioAndFollowersSection(context, index) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
          width: double.infinity,
          child: Text(
            _controller.userDetailsList[index].bio.toString(),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.grey[600]),
          ),
        ),
      ),
      const Divider(
        height: 5,
        thickness: 2,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: Get.width / 2,
            child: ListTile(
              minLeadingWidth: 3,
              leading: const Icon(Icons.people),
              title: Text(
                '${_controller.userDetailsList[index].followers} followers',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              '${_controller.userDetailsList[index].following} following',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey),
            ),
          ),
        ],
      ),
    ],
  );
}

buildTabBarRepositories(context, index) {
  return DefaultTabController(
      length: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 40),
            child: TabBar(
                indicatorColor: Colors.grey,
                indicatorPadding: const EdgeInsets.only(bottom: 5),
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Obx(
                    () => Tab(
                      text:
                          "Repositories: ${_controller.userDetailsList[index].publicRepos.toString()}",
                    ),
                  )
                ]),
          ),
          Container(
              constraints: const BoxConstraints.expand(height: 400),
              child: const TabBarView(children: [RepositoryList()]))
        ],
      ));
}
