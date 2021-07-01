import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/Product/product_page.dart';

class ProductPreview extends StatelessWidget {
  String title, category, imageURI;
  double price;

  ProductPreview(this.title, this.category, this.price, this.imageURI);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/show_product',
              arguments: ProductWithArguments(
                  title, category, price.toString(), 'description', imageURI));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800],
                  )),
              const SizedBox(
                height: 5,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Image.network(imageURI,
                        width: MediaQuery.of(context).size.width * 0.40),
                  ],
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Expanded(
                child: Column(
                    // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${price.toStringAsFixed(2)}',
                        style:
                            const TextStyle(fontSize: 16, letterSpacing: 0.6),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// class ProductPreview extends StatelessWidget {
//   String title, category, imageURI;
//   double price;

//   ProductPreview(this.title, this.category, this.price, this.imageURI);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: InkWell(
//         onTap: () {
//           Navigator.pushNamed(context, '/show_product',
//               arguments: ProductWithArguments(
//                   title, category, price.toString(), 'description', imageURI));
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 category,
//                 style: const TextStyle(color: Colors.grey, fontSize: 13),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Text(title,
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.blue[800],
//                   )),
//               const SizedBox(
//                 height: 5,
//               ),
//               IntrinsicHeight(
//                 child: Row(
//                   children: [
//                     Image.asset(imageURI,
//                         width: MediaQuery.of(context).size.width * 0.40),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 2,
//               ),
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
//                 child: Text(
//                   '\$${price.toStringAsFixed(2)}',
//                   style: const TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }