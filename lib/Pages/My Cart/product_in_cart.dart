import 'package:flutter/material.dart';

class ProductInCart extends StatelessWidget {
  final String product, store, price, quantity, subtotal;
  ProductInCart(
      this.product, this.store, this.price, this.quantity, this.subtotal);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: Colors.blueGrey[900], fontSize: 17),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Product: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text(product,
                  style: const TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Store: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text(store,
                  style: const TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text('\$$price',
                  style: const TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Quantity: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text(quantity,
                  style: const TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal: ',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              Text(
                  '\$${(double.parse(price) * double.parse(quantity)).toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.black,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
