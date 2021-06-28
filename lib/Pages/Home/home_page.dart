import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navigation_test/Pages/Home/category_fade.dart';
import 'package:navigation_test/Pages/Home/category_scroll.dart';
import 'package:navigation_test/Pages/Home/image_slider.dart';
import 'package:navigation_test/Pages/Home/product_preview.dart';
import 'package:navigation_test/Pages/Home/sub_cat_slider.dart';
import 'package:navigation_test/Pages/Home/title_preview.dart';
import 'package:navigation_test/Pages/Product/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<String> phoneBrands = [
    'Samsung',
    'iPhone',
    'Huwawei',
    'Nokia',
    'iPad',
    'Microsoft',
    'Tablets',
    'Airpods',
    'earphones'
  ];
  List<String> beautyCategory = [
    'Make Up',
    'Health Care',
    'Hair Care',
    'Bath & Body'
  ];

  int _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  int _widgetId = 1;

  Widget _renderWidget1() {
    return CategoryFade('Beauty', './asset/Beauty-banner.jpeg');
  }

  Widget _renderWidget2() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/show_category', arguments: 'Phones');
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset('./asset/phones-banner.jpeg'),
      ),
    );
    // CategoryFade('Phones', './asset/phones-banner.jpeg');
  }

  Widget _renderWidget3() {
    return CategoryFade('Bath tubs', './asset/bath-tubs-banner.jpeg');
  }

  Widget _renderWidget4() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/show_category', arguments: 'Olive Oil');
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset('./asset/oliveOil-banner.jpeg'),
      ),
    );
  }

  Widget _renderWidget() {
    if (_widgetId == 1) {
      return _renderWidget1();
    } else if (_widgetId == 2) {
      return _renderWidget2();
    } else if (_widgetId == 3) {
      return _renderWidget3();
    } else {
      return _renderWidget4();
    }
  }

  void _updateWidget() {
    if (_widgetId == 1) {
      _widgetId = 2;
    } else if (_widgetId == 2) {
      _widgetId = 3;
    } else if (_widgetId == 3) {
      _widgetId = 4;
    } else if (_widgetId == 4) {
      _widgetId = 1;
    }
  }

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.decelerate,
      );
    });
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (!mounted) {
        return;
      }
      setState(() {
        _updateWidget();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(1),
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/show_product');
              },
              child: Text('roduct page')),
          SizedBox(
            height: 180,
            child: PageView(
              controller: _pageController,
              children: [
                SliderImageWidget(
                    'THE NEW STANDARD',
                    'UNDER FAVORABLE 360 CAMERAS',
                    749,
                    './asset/slider-img-1.png',
                    const Color(0xFFECEFF1)),
                SliderImageWidget(
                    'THE NEW STANDARD2',
                    'UNDER FAVORABLE 360 CAMERAS2',
                    730,
                    './asset/1-slider-img-3.png',
                    const Color(0xFFECEFF1)),
              ],
            ),
          ),
          Container(
            color: Colors.white70,
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryColumnScroll('Books',
                    'https://urbeys.com/wp-content/uploads/2020/07/4E92DE1A-D163-4F22-93E4-CE1F3B20DA5A-300x300.jpeg'),
                CategoryColumnScroll('Clothing & Fashion',
                    'https://urbeys.com/wp-content/uploads/2020/07/C2DE0EEC-1A23-4FD6-BBC9-DA8FCB8A1602-300x300.jpeg'),
                CategoryColumnScroll('Home & Kitchen',
                    'https://urbeys.com/wp-content/uploads/2020/07/73D1084B-9DB4-4FF5-9636-6C80295219D8-300x300.jpeg'),
                CategoryColumnScroll('Beauty',
                    'https://urbeys.com/wp-content/uploads/2020/08/0573B2C3-D5A1-462B-885A-532FBCE3ADC5-300x300.jpeg'),
                CategoryColumnScroll('Mobile',
                    'https://urbeys.com/wp-content/uploads/2020/07/F8CED81E-1A99-4278-8798-DDC3A67E2A34-300x300.jpeg'),
              ],
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(seconds: 3),
            child: _renderWidget(),
          ),
          TitlePreview('Featured product', 19),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            height: 280,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProductPreview("Refrigerator", "Home appliance", 1000.00,
                    './asset/Smart-wifi-fridge-preview.jpeg'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                ProductPreview("Smart tv", "Home appliance", 1000.00,
                    './asset/roku-tv-preview.jpeg'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                ProductPreview("Refrigerator", "Home appliance", 1000.00,
                    './asset/Smart-wifi-fridge-preview.jpeg'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 140,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                ProductPreview("Smart tv", "Home appliance", 1000.00,
                    './asset/roku-tv-preview.jpeg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              child: Image.asset('./asset/home-appliance-kitches-banner.png'),
              onTap: () {
                Navigator.pushNamed(context, '/show_category',
                    arguments: 'Home appliances');
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TitlePreview('Mobile Phones, Tablets & Asccessories', 19),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            height: 50,
            child: Scrollbar(
              isAlwaysShown: false,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: phoneBrands.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubCategorySlider(phoneBrands[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ProductPreview2(
                            "Samsung Galaxy A107 32GB Memory ,2GB Ram , 6.2 Inch , Octa Core , 13 Mp Camera, Red",
                            "Samsung",
                            130.00,
                            'https://urbeys.com/wp-content/uploads/2020/06/a107_bclack_1_2-300x300.jpg'),
                        const SizedBox(
                          height: 160,
                          child: VerticalDivider(
                            width: 5,
                          ),
                        ),
                        ProductPreview2(
                            "Samsung Galaxy A20S 32GB Memory ,3Gb Ram, 1.8 GHZ Octa Core, 8MP Cam,Micro SD Up to 512 GB Blue",
                            "Samsung",
                            170.00,
                            'https://urbeys.com/wp-content/uploads/2020/06/Samsung-Galaxy-A20S-32GB-Memory-3Gb-Ram-1.8-GHZ-Octa-Core-8MP-CamMicro-SD-Up-to-512-GB-Blue--300x300.jpg'),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ProductPreview2(
                            "Apple, Iphone 8 – 128 GB",
                            "iPhone",
                            650.00,
                            'https://urbeys.com/wp-content/uploads/2020/06/Apple-iPhone-8-Gray-01-300x300.jpg'),
                        const SizedBox(
                          height: 160,
                          child: VerticalDivider(
                            width: 5,
                          ),
                        ),
                        ProductPreview2(
                            "Apple, Iphone X – 64 GB",
                            "iPhone",
                            900.00,
                            'https://urbeys.com/wp-content/uploads/2020/06/Apple-iPhone-x-04-300x300.jpg'),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ProductPreview2(
                            "Apple, Iphone X – 64 GB",
                            "Huawei",
                            120.00,
                            'https://urbeys.com/wp-content/uploads/2020/06/Huawei-Y5-Prime-2019-01-300x300.jpg'),
                        const SizedBox(
                          height: 160,
                          child: VerticalDivider(
                            width: 5,
                          ),
                        ),
                        ProductPreview2(
                            "AirPods without Wireless Charging Case",
                            "Samsung",
                            140.00,
                            'https://urbeys.com/wp-content/uploads/2020/06/Airpods-2-01-300x300.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            child: const Text("-Shop more-"),
            onPressed: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: 'Phone accessories');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              child: Image.network(
                  'https://urbeys.com/wp-content/uploads/2020/08/690x150-1-600x130.png'),
              onTap: () {
                Navigator.pushNamed(context, '/show_category',
                    arguments: 'Food and beverage');
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TitlePreview('Beauty & Health care', 19),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            height: 50,
            child: Scrollbar(
              isAlwaysShown: false,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: beautyCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return SubCategorySlider(beautyCategory[index]);
                },
              ),
            ),
          ),
          Container(
            height: 270,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: IntrinsicHeight(
              child: Row(children: [
                ProductPreview2(
                    '2 In 1 Correcting Eye Cream',
                    'Eye Care',
                    19.00,
                    'https://urbeys.com/wp-content/uploads/2020/07/8081_v4-300x300.jpeg'),
                const SizedBox(
                  height: 160,
                  child: VerticalDivider(
                    width: 5,
                  ),
                ),
                ProductPreview2(
                    '2 In 1 Correcting Eye Cream',
                    'Eye Care',
                    19.00,
                    'https://urbeys.com/wp-content/uploads/2020/07/8081_v4-300x300.jpeg'),
              ]),
            ),
          ),
          TextButton(
            child: const Text("-Shop more-"),
            onPressed: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: 'Beauty');
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
            child: GestureDetector(
              child: Image.network(
                  'https://urbeys.com/wp-content/uploads/2020/08/690x150-600x130.png'),
              onTap: () {
                Navigator.pushNamed(context, '/show_category',
                    arguments: 'Natural products');
              },
            ),
          ),
          TitlePreview('Home Appliances', 19),
          Container(
            height: 270,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: IntrinsicHeight(
              child: Row(children: [
                ProductPreview2(
                    'Smart wifi refrigerator',
                    'Home Appliances',
                    19.00,
                    'https://urbeys.com/wp-content/uploads/2020/08/D389371F-4864-46E8-9FB7-206D177194C2-300x300.jpeg'),
                const SizedBox(
                  height: 160,
                  child: VerticalDivider(
                    width: 5,
                  ),
                ),
                ProductPreview2('4k Roku TV', 'Home Appliances', 19.00,
                    'https://urbeys.com/wp-content/uploads/2020/08/CAF21FA4-1B8D-4C19-A69C-9C7097810A4F-300x300.jpeg'),
              ]),
            ),
          ),
          TextButton(
            child: const Text("-Shop more-"),
            onPressed: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: 'Home Appliances');
            },
          ),
          TitlePreview('Natural Prodcuts', 19),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ProductPreview2("Sabuna", "Soap", 1.00,
                            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_300,h_300/https://urbeys.com/wp-content/uploads/2020/07/sabunav2-300x300.jpg'),
                        const SizedBox(
                          height: 160,
                          child: VerticalDivider(
                            width: 5,
                          ),
                        ),
                        ProductPreview2(
                            "Agriya Natural Three Berry Jam(370 g)",
                            "Jam",
                            12.00,
                            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_300,h_300/https://urbeys.com/wp-content/uploads/2020/07/32D3780C-E396-4195-8A0C-158D8F512F07-300x300.png'),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ProductPreview2(
                            "Agriya Natural StrawBerry Jam(370 g)",
                            "Jam",
                            12.00,
                            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_300,h_300/https://urbeys.com/wp-content/uploads/2020/07/565D50C0-FCAF-4B4F-B5FB-322C6869EABB-300x300.png'),
                        const SizedBox(
                          height: 160,
                          child: VerticalDivider(
                            width: 5,
                          ),
                        ),
                        ProductPreview2(
                            "Agriya Natural Apricor jam(370 g)",
                            "Jam",
                            12.00,
                            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_300,h_300/https://urbeys.com/wp-content/uploads/2020/07/C5D9E232-86AC-4E23-934D-42D532E60675-300x300.png'),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        ProductPreview2(
                            "Agrya Olive Oil Soap (Original)",
                            "Soap",
                            12.00,
                            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_300,h_300/https://urbeys.com/wp-content/uploads/2020/07/F70F8E5F-2073-4D0E-97CE-D525B241C7BD_4_5005_c-300x300.jpeg'),
                        const SizedBox(
                          height: 160,
                          child: VerticalDivider(
                            width: 5,
                          ),
                        ),
                        ProductPreview2(
                            "Agrya Olive Oil Soap (Bay leaves)",
                            "Soap",
                            9.00,
                            'https://cdn.shortpixel.ai/client/q_glossy,ret_img,w_300,h_300/https://urbeys.com/wp-content/uploads/2020/07/09D41269-770E-4EA8-885B-0287AB76C357-300x300.jpeg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            child: const Text("-Shop more-"),
            onPressed: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: 'Natural products');
            },
          ),
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.blueGrey[700],
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(children: [
                Image.asset('./asset/mobile_logo.png'),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: Text('Got Questions ? Call us 24/7!',
                      style: TextStyle(color: Colors.white)),
                ),
                const Text('(+961) 79 104 222',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
