import 'package:flutter/material.dart';

class CustomTextHeader extends StatelessWidget {
  String mainText, secondaryText;
  int price;

  CustomTextHeader(this.mainText, this.secondaryText, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              secondaryText,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("From"),
                Text(
                  "${price.toString()}\$",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            )
          ]),
    );
  }
}
