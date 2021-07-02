import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/My%20Cart/product_in_cart.dart';
import 'package:navigation_test/app_bar.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List productsList = [
    ProductInCart(
        'This is a product', 'This is a store', '1000.00', '2', '2000.00'),
    ProductInCart(
        'This is a product2', 'This is a store2', '500.00', '2', '3000.00'),
    ProductInCart(
        'This is a product3', 'This is a store3', '0.00', '2', '4000.00'),
  ];
  void removeFromCart(int index) {
    setState(() {
      keyList.currentState!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) => _buildItem(
            context, productsList[index], index, animation, removeFromCart),
        duration: const Duration(milliseconds: 150),
      );
      productsList.removeAt(index);
    });
  }

  final GlobalKey<AnimatedListState> keyList = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMod(),
      body: Container(
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
            Expanded(
              child: AnimatedList(
                key: keyList,
                initialItemCount: productsList.length,
                itemBuilder: (context, index, animation) => _buildItem(context,
                    productsList[index], index, animation, removeFromCart),
              ),
            ),
          ],
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
          borderRadius: BorderRadius.all(Radius.circular(30)),
          onTap: () {
            removeFromCart(index);
          },
          child: const Icon(Icons.close),
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
