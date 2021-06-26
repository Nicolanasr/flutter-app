import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navigation_test/show_by_category.dart';
import 'package:navigation_test/user_profile.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';

class CustomTextHeader extends StatelessWidget {
  String mainText, secondaryText;
  int price;

  CustomTextHeader(this.mainText, this.secondaryText, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainText,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              secondaryText,
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("From"),
                Text(
                  "${price.toString()}\$",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            )
          ]),
    );
  }
}

class SliderImageWidget extends StatelessWidget {
  String primaryText, secondaryText, imageURI;
  int price;
  Color colorGiven;

  SliderImageWidget(this.primaryText, this.secondaryText, this.price,
      this.imageURI, this.colorGiven);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
        child: Container(
          child: CustomTextHeader(primaryText, secondaryText, price),
          height: 160,
          color: Colors.blueGrey[50],
        ),
      ),
      Container(
        decoration: BoxDecoration(color: colorGiven),
        child: Image.asset(
          imageURI,
          width: 100,
          height: 160,
        ),
      ),
      Container(
        height: 160,
        width: 50,
        color: Colors.blueGrey[50],
      ),
    ]);
  }
}

class CategoryColumnScroll extends StatelessWidget {
  String text, imageURI;
  CategoryColumnScroll(this.text, this.imageURI);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/show_category', arguments: text);
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Image.network(
                imageURI,
                width: 120.0,
              ),
            ),
            SizedBox(height: 10),
            Container(
              child: Text(
                text,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

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
          Navigator.pushNamed(context, '/show_category', arguments: title);
        },
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 2,
              ),
              Text(title,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue[800],
                  )),
              SizedBox(
                height: 5,
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Image.asset(imageURI,
                        width: MediaQuery.of(context).size.width * 0.40),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int _counterFade = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      setState(() {
        if (_counterFade < 3) {
          _counterFade++;
        } else {
          _counterFade = 0;
        }
      });

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.decelerate,
      );
    });
  }

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(1),
        child: Column(children: [
          Container(
            height: 180,
            child: PageView(
              controller: _pageController,
              children: [
                SliderImageWidget(
                    'THE NEW STANDARD',
                    'UNDER FAVORABLE 360 CAMERAS',
                    749,
                    './asset/slider-img-1.png',
                    Color(0xFFECEFF1)),
                SliderImageWidget(
                    'THE NEW STANDARD2',
                    'UNDER FAVORABLE 360 CAMERAS2',
                    730,
                    './asset/1-slider-img-3.png',
                    Color(0xFFECEFF1)),
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
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: 'Beauty');
            },
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset('./asset/Beauty-banner.jpeg'),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/show_category',
                  arguments: 'Phones');
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Image.asset('./asset/phones-banner.jpeg'),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "Featured product",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -7))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.indigo[700],
                  decorationThickness: 1.4,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            height: 260,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ProductPreview("Refrigerator", "Home appliance", 1000.00,
                    './asset/Smart-wifi-fridge-preview.jpeg'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
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
                    Container(
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
                    Container(
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
          Container(
              height: 100,
              width: 100,
              child: PageView.builder(
                itemCount: 1,
                itemBuilder: (context, position) {
                  if (_counterFade == 0) {
                    return FadeTransition(
                      opacity: animation,
                      // The green box must be a child of the FadeTransition widget.
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        color: Colors.green,
                      ),
                    );
                  } else if (_counterFade == 1) {
                    return FadeTransition(
                      opacity: animation,
                      // The green box must be a child of the FadeTransition widget.
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return FadeTransition(
                      opacity: animation,
                      // The green box must be a child of the AnimatedOpacity widget.
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        color: Colors.lightBlue,
                      ),
                    );
                  }
                },
              ))
        ]),
      ),
    );

    // Column(
    //   children: [
    //     SizedBox(
    //       height: 100,
    //       child: PageView(
    //         controller: _controller,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SizedBox(
    //               child: Container(
    //                 color: Colors.amber,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SizedBox(
    //               width: 200,
    //               child: Container(
    //                 color: Colors.red,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SizedBox(
    //               width: 200,
    //               child: Container(
    //                 color: Colors.lightBlue,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SizedBox(
    //               width: 200,
    //               child: Container(
    //                 color: Colors.lightBlue,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SizedBox(
    //               width: 200,
    //               child: Container(
    //                 color: Colors.lightBlue,
    //               ),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: SizedBox(
    //               width: 200,
    //               child: Container(
    //                 color: Colors.lightBlue,
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
