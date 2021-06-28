import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/Home/text_header_for_slider.dart';

class SliderImageWidget extends StatelessWidget {
  String primaryText, secondaryText, imageURI;
  int price;
  Color colorGiven;

  SliderImageWidget(this.primaryText, this.secondaryText, this.price,
      this.imageURI, this.colorGiven);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: Container(
          child: CustomTextHeader(primaryText, secondaryText, price),
          height: 160,
          color: Colors.blueGrey[50],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: colorGiven),
        child: Image.asset(
          imageURI,
          width: 100,
          height: 160,
        ),
      ),
      Container(
        height: 160,
        width: 50,
        color: Colors.blueGrey[50],
      ),
    ]);
  }
}
