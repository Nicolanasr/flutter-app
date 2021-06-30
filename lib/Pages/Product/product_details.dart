import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetails extends StatelessWidget {
  String name, category, price, description, image;
  ProductDetails(
      this.name, this.category, this.price, this.description, this.image);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.network(
              image,
              height: 400,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const SizedBox(
                    height: 400,
                    child: SpinKitDoubleBounce(
                      color: Colors.blue,
                      size: 50.0,
                    ));
                // child: Center(child: Text('Loading...')));
              },
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                  height: 400,
                  child: Center(
                      child: Text(
                          'Something went wrong while loading the image check your internet connection and try again!'))),
            ),
          ),
          Text(category, style: TextStyle(color: Colors.grey[500])),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 24, color: Colors.blueGrey[800]),
          ),
          const Divider(
            height: 20,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              InkWell(
                splashColor: Colors.red[200],
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.favorite_outline, color: Colors.grey[700]),
                      Text(
                        'Add to wishlist',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(Icons.compare_arrows_rounded,
                            color: Colors.grey[700]),
                        Text('Compare',
                            style: TextStyle(color: Colors.grey[700]))
                      ],
                    )),
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(description,
              style: TextStyle(
                  color: Colors.grey[800], height: 1.5, letterSpacing: 0.2)),
          const Divider(
            height: 20,
          ),
        ],
      ),
    ));
  }
}
