import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/Product/add_to_cart.dart';
import 'package:navigation_test/Pages/Product/product_details.dart';

import 'package:navigation_test/app_bar.dart';

import 'package:navigation_test/Pages/Product/Tabs/more_products_tab.dart';
import 'package:navigation_test/Pages/Product/Tabs/vendor_info_tab.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review Tab/reviews_tab.dart';
import 'package:navigation_test/Pages/Product/Tabs/shipping_tab.dart';

class ProductWithArguments {
  String name, category, price, description, image;
  ProductWithArguments(
      this.name, this.category, this.price, this.description, this.image);
}

class Product extends StatefulWidget {
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> with TickerProviderStateMixin {
  late List<Tab> tabList = [
    const Tab(
      child: Text(
        'Shipping',
      ),
    ),
    const Tab(
      child: Text(
        'Reviews',
      ),
    ),
    const Tab(
      child: Text(
        'Vendor Info',
      ),
    ),
    const Tab(
      child: Text(
        'More products',
      ),
    ),
  ];

  late TabController _tabController =
      TabController(vsync: this, length: tabList.length);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductWithArguments;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: Scaffold(
          bottomSheet: AddToCart(args.price),
          appBar: const AppBarMod(),
          body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverToBoxAdapter(
                    child: ProductDetails(args.name, args.category, args.price,
                        args.description, args.image)),
                SliverToBoxAdapter(
                  child: TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.black38,
                    controller: _tabController,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: tabList,
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: const [
                ShippingTab(),
                ReviewsTab(),
                VenderInfoTab(),
                MoreProductsTab()
              ],
            ),
          ),
        ));
  }
}
