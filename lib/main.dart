import 'package:flutter/material.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';

import './page1.dart';
import './page2.dart';
import './sidebar.dart';
import './user_profile.dart';
import './show_by_category.dart';
import './app_bar.dart';
import './by_category.dart';
import './home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(),
      '/page1': (context) => const Page1(),
      '/page2': (context) => const Page2(),
      '/user_profile': (context) => const UserProfile(),
      '/show_category': (context) => const ShowCategory(),
    },
    title: 'Flutter Demo',
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Widget> listOfWidgets = [
    HomePage(),
    ByCategoryTab(),
    Center(
      child: Text("By Sellers"),
    )
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
      appBar: const AppBarMod(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'By Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'By Sellers',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[600],
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: listOfWidgets[_selectedIndex],
      ),
    );
  }
}
