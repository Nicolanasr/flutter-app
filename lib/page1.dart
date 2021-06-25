import 'package:flutter/material.dart';

import 'package:navigation_test/page2.dart';
import 'package:navigation_test/sidebar.dart';
import 'package:navigation_test/sidebar.dart';

import 'app_bar.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/page2');
              },
              child: Text("To page 2")),
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
