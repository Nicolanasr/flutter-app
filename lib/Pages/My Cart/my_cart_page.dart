import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:navigation_test/Pages/My%20Cart/storage_file.dart';
import 'package:navigation_test/Pages/My%20Cart/product_in_cart.dart';
import 'package:navigation_test/app_bar.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  void removeFromCart(int index) {
    setState(() {
      keyList.currentState!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) => _buildItem(
            context, productsList[index], index, animation, removeFromCart),
        duration: const Duration(milliseconds: 200),
      );
      productsList.removeAt(index);
    });
  }

  final GlobalKey<AnimatedListState> keyList = GlobalKey();

  CartStorage myCart = CartStorage();

  List productsList = [
    ProductInCart('product1', 'store', '10', '10', 'subtotal'),
    ProductInCart('product2', 'store', '10', '10', 'subtotal'),
    ProductInCart('product3', 'store', '10', '10', 'subtotal'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMod(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Cart',
                  style: TextStyle(color: Colors.blueGrey[800], fontSize: 28),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnimatedList(
                shrinkWrap: true,
                primary: false,
                key: keyList,
                initialItemCount: productsList.length,
                itemBuilder: (context, index, animation) => _buildItem(context,
                    productsList[index], index, animation, removeFromCart),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildItem(BuildContext context, ProductInCart item, int index,
    Animation<double> animation, removeFromCart) {
  return FadeTransition(
    child: Column(children: [
      Align(
        alignment: Alignment.topRight,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          onTap: () {
            removeFromCart(index);
          },
          child: const SizedBox(
            height: 25,
            width: 25,
            child: Tooltip(
              message: 'Remove product from cart',
              child: Icon(
                Icons.close,
                size: 18,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      item,
      const Divider(
        height: 40,
      )
    ]),
    opacity: animation,
  );
}
