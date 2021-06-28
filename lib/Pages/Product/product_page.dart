import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_test/Pages/Product/product_bottom_tab.dart';
import 'package:navigation_test/app_bar.dart';

class Product extends StatefulWidget {
  Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  TextEditingController quantityController = TextEditingController()
    ..text = '1';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: Scaffold(
          bottomSheet: Container(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '\$120.00',
                  style: TextStyle(
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
                  onPressed: () {},
                  child: Row(children: const [
                    Icon(Icons.add_shopping_cart_sharp),
                    Text('Add to cart')
                  ]),
                )
              ],
            ),
          ),
          appBar: const AppBarMod(),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_600/https://urbeys.com/wp-content/uploads/2020/06/Huawei-Y5-Prime-2019-01.jpg',
                      height: 400,
                    ),
                  ),
                  Text('Category', style: TextStyle(color: Colors.grey[500])),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Product Name',
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
                              Icon(Icons.favorite_outline,
                                  color: Colors.grey[700]),
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
                  Text(
                      "HUAWEI Mate 20 Pro owns an aesthetic signature with an iconic square combining Leica triple camera and one flash. The new ultra wide-angle Leica Triple Camera powered by AI reveals life’s drama, texture, color, and beauty in every photograph. With the Kirin 980 processor and the advanced and flexible CPU and GPU multi-core architecture, task and operation speed of the device has been greatly increased. The 4200 mAh battery with supercharging for an always online pleasure\n\nUNLEASH YOUR CREATIVITY\n\nThe new Leica Triple Camera powered by AI reveals life’s drama, texture, color and beauty in every photograph that will take your breath away.Designed for different scenarios, the 12 MP main RGB lens captures great details in everyday photos, while the 8 MP telephoto lens will focus on your distant shots and the new 16 MP Leica Ultra Wide Angle Lens is perfect for the landscape photos and macro shots.\nBROADEN YOUR HORIZONS\n\nDon’t let the camera limit your view. With the Leica Ultra Wide Angle Lens, capture an imposingly wide perspective even from the confines of tight spaces.\n\nIN-SCREEN FINGERPRINT\n\nWith the ergonomic design and Dynamic Pressure Sensing technology, you just need to raise your finger and touch the screen, your phone will get unlocked securely and instantly.\n\nMASSIVE CAPACITY, LONGER, SAFER, FASTER\n\nEnduring power is always the symbol of the Mate series. A larger 4200 mAh* battery with smarter AI power management fuels your daily work and entertainment needs.*Typical value. Based on results from HUAWEI lab tests. Battery life depends on actual usage situation.\n",
                      style: TextStyle(
                          color: Colors.grey[800],
                          height: 1.5,
                          letterSpacing: 0.2)),
                  const Divider(
                    height: 20,
                  ),
                  ProductTab(),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0))
                ],
              ),
            ),
          ),
        ));
  }
}
