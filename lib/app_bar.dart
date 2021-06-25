import 'package:flutter/material.dart';
import 'package:navigation_test/main.dart';

var recent = [];

class AppBarMod extends StatefulWidget implements PreferredSizeWidget {
  const AppBarMod({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  _AppBarModState createState() => _AppBarModState();
}

class _AppBarModState extends State<AppBarMod> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: GestureDetector(
          child: Image.asset(
            './asset/mobile_logo.png',
            width: 100,
          ),
          onTap: () {
            if (ModalRoute.of(context)!.settings.name != '/') {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final randomList = [
    "Beirut",
    "Zgharta",
    "Bsalim",
    "Halba",
    "Ashrafiye",
    "Sidon",
    "Dik el Mehdi",
    "Baalbek",
    "Tripoli",
    "Baabda",
    "Adma",
    "Hboub",
    "Yanar",
    "Dbaiye",
    "Aaley",
    "Broummana",
    "Sarba",
    "Chekka"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, "");
      },
    );
  }

  void addToRecent(List recent, List itemList, int index) {
    if (!recent.contains(itemList[index])) {
      recent.insert(0, itemList[index]);
      if (recent.length > 10) {
        recent.removeLast();
      }
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggesionList = query.isEmpty
        ? recent
        : randomList
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();

    if (suggesionList.isEmpty) {
      if (query == "") {
        return ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              addToRecent(recent, suggesionList, index);
              Navigator.pushNamed(context, '/show_category',
                  arguments: suggesionList[index]);
            },
            title: Text(randomList[index]),
          ),
          itemCount: randomList.length,
        );
      }
      return Center(
        child: Text(
          '"$query" was not found',
          textAlign: TextAlign.center,
        ),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          addToRecent(recent, suggesionList, index);
          Navigator.pushNamed(context, '/show_category',
              arguments: suggesionList[index]);
        },
        title: Text(suggesionList[index]),
      ),
      itemCount: suggesionList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggesionList = query.isEmpty
        ? recent
        : randomList
            .where((element) =>
                element.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          addToRecent(recent, suggesionList, index);
          Navigator.pushNamedAndRemoveUntil(
              context, '/show_category', ModalRoute.withName('/'),
              arguments: suggesionList[index]);
        },
        title: Text(suggesionList[index]),
      ),
      itemCount: suggesionList.length,
    );
  }
}
