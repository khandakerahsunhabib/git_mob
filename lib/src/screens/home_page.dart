import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/first_page_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final FirstPageController _controller = Get.put(FirstPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        drawer: const Drawer(),
        body: Obx(
          () => ListView.builder(
              itemCount: _controller.userDetailsList.length,
              itemBuilder: (context, index) {
                return upperPart(context, index);
              }),
        ));
  }

  Widget upperPart(context, index) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
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
                          .copyWith(fontSize: 20),
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                _controller.userDetailsList[index].bio.toString(),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(),
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
          )
        ],
      ),
    );
  }
}
