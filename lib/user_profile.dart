import 'package:flutter/material.dart';
import 'package:navigation_test/sidebar.dart';

import 'app_bar.dart';

class User {
  String username, first_name, last_name;
  int age;

  User(this.username, this.first_name, this.last_name, this.age);
}

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);
  static const routeName = '/user_profile';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBarMod(),
      drawer: SideBar(),
      body: Column(
        children: [
          Text(args.username),
          Text(args.first_name),
          Text(args.last_name),
          Text(args.age.toString()),
        ],
      ),
    );
  }
}
