import 'package:flutter/material.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('1'),
            );
          }),
    );
  }
}
