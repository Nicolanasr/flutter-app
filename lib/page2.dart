import 'package:flutter/material.dart';

import 'package:navigation_test/main.dart';
import 'package:navigation_test/sidebar.dart';
import 'package:navigation_test/user_profile.dart';

import 'app_bar.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMod(),
      drawer: SideBar(),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text("To home")),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("previous")),
        ],
      )),
    );
  }
}
