import 'package:flutter/material.dart';
import 'package:navigation_test/app_bar.dart';

class ByCategory {}

class ShowCategory extends StatelessWidget {
  const ShowCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    print("args contain: $args");
    return Scaffold(
      appBar: AppBarMod(),
      body: Text("This is category with args: $args"),
    );
  }
}
