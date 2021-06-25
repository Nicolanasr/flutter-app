import 'package:flutter/material.dart';
import 'package:navigation_test/user_profile.dart';
import 'package:snapping_page_scroll/snapping_page_scroll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _controller = PageController(initialPage: 1);
  var _color = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Expanded(
            child: Container(
              height: 150,
              color: Colors.blueGrey[50],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey[50]),
            child: Image.asset(
              './asset/slider-img-1.png',
              width: 100,
              height: 150,
            ),
          ),
          Container(
            height: 150,
            width: 50,
            color: Colors.blueGrey[50],
          ),
        ]),
        Expanded(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 100,
                child: Text("data"),
              ),
              Container(
                width: 100,
                child: Text("data"),
              ),
              Container(
                width: 100,
                child: Text("data"),
              ),
              Container(
                width: 100,
                child: Text("data"),
              ),
              Container(
                width: 100,
                child: Text("data"),
              ),
              Container(
                width: 100,
                child: Text("data"),
              ),
            ],
          ),
        ),
        Text("data"),
      ]),
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
