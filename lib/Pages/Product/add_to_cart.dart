import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_bar.dart';

class AddToCart extends StatelessWidget {
  String price;
  GlobalKey<AppBarModState> keyForBar;

  AddToCart(this.price, this.keyForBar);

  TextEditingController quantityController = TextEditingController()
    ..text = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration: BoxDecoration(
            border:
                Border(top: BorderSide(color: Theme.of(context).dividerColor)),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$$price',
              style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black87,
                  fontWeight: FontWeight.w300),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 30,
              height: 25,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: quantityController,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Added Item to cart')));
                keyForBar.currentState!.increaseCount();
              },
              child: Row(children: const [
                Icon(Icons.add_shopping_cart_sharp),
                Text('Add to cart')
              ]),
            )
          ],
        ));
  }
}
