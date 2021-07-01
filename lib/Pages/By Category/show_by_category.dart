import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/Home/product_preview.dart';
import 'package:navigation_test/app_bar.dart';

class ByCategory {}

class ShowCategory extends StatefulWidget {
  List<ProductPreview> productsList = [
    ProductPreview(
      "Samsung Galaxy A107 32GB Memory ,2GB Ram , 6.2 Inch , Octa Core , 13 Mp Camera, Red",
      "Samsung",
      130.00,
      'https://urbeys.com/wp-content/uploads/2020/06/a107_bclack_1_2-300x300.jpg',
    ),
    ProductPreview(
        "Samsung Galaxy A20S 32GB Memory ,3Gb Ram, 1.8 GHZ Octa Core, 8MP Cam,Micro SD Up to 512 GB Blue",
        "Samsung",
        170.00,
        'https://urbeys.com/wp-content/uploads/2020/06/Samsung-Galaxy-A20S-32GB-Memory-3Gb-Ram-1.8-GHZ-Octa-Core-8MP-CamMicro-SD-Up-to-512-GB-Blue--300x300.jpg'),
    ProductPreview("Apple, Iphone 8 – 128 GB", "iPhone", 650.00,
        'https://urbeys.com/wp-content/uploads/2020/06/Apple-iPhone-8-Gray-01-300x300.jpg'),
    ProductPreview("Apple, Iphone X – 64 GB", "iPhone", 900.00,
        'https://urbeys.com/wp-content/uploads/2020/06/Apple-iPhone-x-04-300x300.jpg'),
    ProductPreview("Apple, Iphone X – 64 GB", "Huawei", 120.00,
        'https://urbeys.com/wp-content/uploads/2020/06/Huawei-Y5-Prime-2019-01-300x300.jpg'),
    ProductPreview("AirPods without Wireless Charging Case", "Samsung", 140.00,
        'https://urbeys.com/wp-content/uploads/2020/06/Airpods-2-01-300x300.jpg'),
  ];

  ShowCategory({Key? key}) : super(key: key);

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  String dropdownValue = 'Default Sorting';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: const AppBarMod(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                args.toString(),
                style: TextStyle(fontSize: 22, color: Colors.blueGrey[900]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey[50],
                height: 50,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.filter_alt_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Filter'),
                        ],
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.sort),
                        iconSize: 24,
                        elevation: 16,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: [
                          'Default Sorting',
                          'Sort by popularity',
                          'Sort by average rating',
                          'Sort by latest',
                          'Sort by price: low to high',
                          'Sort by price: high to low',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text('${widget.productsList.length} items were found.'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      for (int i = 0; i < widget.productsList.length; i = i + 2)
                        ProductColumn(
                          ProductRow(widget.productsList[i],
                              widget.productsList[i + 1]),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductColumn extends StatelessWidget {
  ProductRow pRow;
  ProductColumn(this.pRow);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pRow,
        const Divider(
          height: 15,
        ),
      ],
    );
  }
}

class ProductRow extends StatelessWidget {
  ProductPreview product1, product2;
  ProductRow(this.product1, this.product2);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          product1,
          const SizedBox(
            height: 160,
            child: VerticalDivider(
              width: 15,
            ),
          ),
          product2,
        ],
      ),
    );
  }
}
