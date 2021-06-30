import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/review_form.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/star_display.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/star_rating.dart';

class ReviewsTab extends StatefulWidget {
  const ReviewsTab({Key? key}) : super(key: key);

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
  int reviewCount = 0;
  double overallRating = 0.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Color(0xFF333e48)),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Based on $reviewCount reviews",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(overallRating.toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        const Text('Overall')
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    StarDisplay(5),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(4),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(3),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(2),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(1),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  const SizedBox(height: 20),
                  reviewCount == 0
                      ? const Text(
                          "Be the first to review this product",
                          style: TextStyle(fontSize: 18),
                        )
                      : const Text(""),
                  const SizedBox(height: 20),
                  ReviewForm(),
                  const SizedBox(height: 20),
                  reviewCount == 0
                      ? const Text(
                          "There are no reviews yet",
                          style: TextStyle(fontSize: 18),
                        )
                      : const Text(""),
                ]),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 100))
        ],
      ),
    );
  }
}
