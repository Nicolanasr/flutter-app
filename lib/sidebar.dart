import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SubCategory {
  String subCategoryTitle;
  List subCategoryBody;

  SubCategory(this.subCategoryTitle, this.subCategoryBody);
}

class Category {
  String category;
  List<SubCategory> subCat;
  Category(this.category, this.subCat);
}

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  var categories = [
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category', [
      SubCategory('sub1', ['sub1body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
    Category('Category2', [
      SubCategory('sub1', ['sub021body1', 'sub1body2', 'sub1body3']),
      SubCategory('sub2', ['sub2body1', 'sub2body2', 'sub2body3']),
      SubCategory('sub3', ['sub3body1', 'sub3body2', 'sub3body3'])
    ]),
  ];

  var isExpanded = false;

  categoriesLoopShow(int i) {
    var subCatList = categories[i].subCat;
    return ExpansionTile(
        collapsedIconColor: Colors.white,
        backgroundColor: Colors.black,
        childrenPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        title: Text(
          categories[i].category.toString(),
        ),
        children: [
          for (int j = 0; j < subCatList.length; j++)
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  title: Text(
                    subCatList[j].subCategoryTitle,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                for (String subCatBody in subCatList[j].subCategoryBody)
                  ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/show_category',
                          arguments: subCatBody);
                    },
                    title: Text(subCatBody,
                        style: TextStyle(color: Colors.grey[400])),
                  )
              ],
            ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[850],
            textTheme:
                TextTheme(bodyText1: TextStyle(color: Colors.grey[300]))),
        child: Container(
          width: 250,
          child: Drawer(
            child: ListView(children: [
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text(
                      "DAILY OFFERS",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    title: const Text(
                      "Search By Store",
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Divider(height: 10, color: Colors.black),
                  for (int i = 0; i < categories.length; i++)
                    categoriesLoopShow(i),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
