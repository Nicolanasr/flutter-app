import 'package:flutter/material.dart';

class CategoryFade extends StatelessWidget {
  String categoryName, image;
  CategoryFade(this.categoryName, this.image);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/show_category', arguments: categoryName);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(image),
      ),
    );
  }
}
