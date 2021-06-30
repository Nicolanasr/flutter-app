import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:navigation_test/Pages/Product/product_page.dart';

import './sidebar.dart';
import 'package:navigation_test/Pages/By Category/show_by_category.dart';
import './app_bar.dart';
import 'package:navigation_test/Pages/By Category/by_category.dart';
import 'package:navigation_test/Pages/Home/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(),
      '/show_category': (context) => const ShowCategory(),
      '/show_product': (context) => Product(),
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

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    dataLoadFunction(); // this function gets called
  }

  dataLoadFunction() async {
    setState(() {
      _isLoading = true; // your loader has started to load
    });
    // fetch you data over here
    setState(() {
      _isLoading = false; // your loder will stop to finish after the data fetch
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SpinKitDoubleBounce(
            color: Colors.blue,
            size: 50.0,
          )
        : Scaffold(
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
