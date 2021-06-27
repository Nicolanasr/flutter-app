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

class ByCategoryTab extends StatefulWidget {
  const ByCategoryTab({Key? key}) : super(key: key);

  @override
  _ByCategoryTabState createState() => _ByCategoryTabState();
}

class _ByCategoryTabState extends State<ByCategoryTab> {
  var categories = [
    Category('Beauty & Health Care', [
      SubCategory('Bath & Body', [
        'Bath And Shower',
        'Body Care',
        'Eye care',
        'Hair removal',
        'Hand & Foor Care'
      ]),
      SubCategory('Health Care', [
        'Blood Pressure Monitors',
        'Dental Care',
        'Medical Equipment',
        'Personal Scales',
        'Supplements'
      ]),
      SubCategory('Hair Care', [
        'Hair Dryers',
        'Hair Curlers',
        'Hair Straigteners',
        'Hair Styling & Treatments',
        'Shampoo & Conditioner'
      ])
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
        collapsedIconColor: Colors.grey,
        backgroundColor: Colors.black87,
        childrenPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        title: Row(
          children: [
            Text(
              categories[i].category.toString(),
            ),
          ],
        ),
        children: [
          for (int j = 0; j < subCatList.length; j++)
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    subCatList[j].subCategoryTitle,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 0.5,
                ),
                for (String subCatBody in subCatList[j].subCategoryBody)
                  ListTile(
                    dense: true,
                    onTap: () {
                      Navigator.pushNamed(context, '/show_category',
                          arguments: subCatBody);
                    },
                    title: Text(subCatBody,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16)),
                  )
              ],
            ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(children: [
        Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
          child: const Text(
            "Browse By Category: ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const Divider(),
        Column(
          children: <Widget>[
            for (int i = 0; i < categories.length; i++) categoriesLoopShow(i),
          ],
        ),
      ]),
    );
  }
}
