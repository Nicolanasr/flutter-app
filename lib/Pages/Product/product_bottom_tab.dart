import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/Product/Tabs/more_products_tab.dart';
import 'package:navigation_test/Pages/Product/Tabs/reviews_tab.dart';
import 'package:navigation_test/Pages/Product/Tabs/shipping_tab.dart';
import 'package:navigation_test/Pages/Product/Tabs/vendor_info_tab.dart';

void main() {
  runApp(ProductTab());
}

class ProductTab extends StatefulWidget {
  @override
  State<ProductTab> createState() => _ProductTabState();
}

class _ProductTabState extends State<ProductTab> with TickerProviderStateMixin {
  late List<Tab> tabList = [
    const Tab(
      child: Text(
        'Shipping',
        style: TextStyle(color: Colors.black87),
      ),
    ),
    const Tab(
      child: Text(
        'Reviews',
        style: TextStyle(color: Colors.black87),
      ),
    ),
    const Tab(
      child: Text(
        'Vendor Info',
        style: TextStyle(color: Colors.black87),
      ),
    ),
    const Tab(
      child: Text(
        'More products',
        style: TextStyle(color: Colors.black87),
      ),
    ),
  ];
  late TabController _tabController =
      TabController(vsync: this, length: tabList.length);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
          labelColor: Colors.black87,
          unselectedLabelColor: Colors.black54,
          controller: _tabController,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: tabList),
      SizedBox(
        height: 100.0,
        // ignore: prefer_const_literals_to_create_immutables
        child: TabBarView(controller: _tabController, children: [
          const Tab(
            child: ShippingTab(),
          ),
          const Tab(
            child: ReviewsTab(),
          ),
          const Tab(
            child: VenderInfoTab(),
          ),
          const Tab(
            child: MoreProductsTab(),
          )
        ]),
      ),
    ]);
  }
}
