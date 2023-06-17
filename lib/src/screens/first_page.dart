import 'package:flutter/material.dart';
import '../settings/settings_view.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

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
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              )
            ]),
          )
        ],
      ),
    );
  }
}
