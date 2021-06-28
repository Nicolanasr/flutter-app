import 'package:flutter/material.dart';

class SubCategorySlider extends StatelessWidget {
  String category;
  SubCategorySlider(this.category);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Material(
        child: InkWell(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
                child: Text(category)),
            onTap: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: category);
            }),
      ),
    );
  }
}
