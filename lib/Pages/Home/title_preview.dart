import 'package:flutter/material.dart';

class TitlePreview extends StatelessWidget {
  String title;
  double fontSize;

  TitlePreview(this.title, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                shadows: [
                  const Shadow(color: Colors.black, offset: Offset(0, -7))
                ],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Colors.indigo[700],
                decorationThickness: 1.4,
                decorationStyle: TextDecorationStyle.solid,
              ),
            ),
            const Divider(
              height: 5,
            ),
          ]),
    );
  }
}
