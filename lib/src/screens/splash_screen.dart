import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'first_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 2), () {
      checkInternetConnectivity(context);
    });
  }

  Future<void> checkInternetConnectivity(context) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('No Internet Connection'),
            content: const Text('Please try again later.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Exit'),
                onPressed: () => exit(0),
              ),
            ],
          );
        },
      );
    } else {
      Get.to(() => FirstPage());
    }
  }
}
