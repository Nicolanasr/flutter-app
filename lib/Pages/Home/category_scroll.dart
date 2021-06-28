import 'package:flutter/material.dart';

class CategoryColumnScroll extends StatelessWidget {
  String text, imageURI;
  CategoryColumnScroll(this.text, this.imageURI);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/show_category', arguments: text);
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Image.network(
                imageURI,
                width: 120.0,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ]),
        ),
      ),
    );
  }
}
