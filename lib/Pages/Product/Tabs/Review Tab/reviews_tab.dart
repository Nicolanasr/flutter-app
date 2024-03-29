import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/review_form.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/star_display.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/star_rating.dart';

class ReviewsTab extends StatefulWidget {
  final int reviewCount = 0,
      fiveStars = 0,
      fourStars = 0,
      threeStars = 0,
      twoStars = 0,
      oneStar = 0;
  final double overallRating = 0.0;

  const ReviewsTab({Key? key}) : super(key: key);

  @override
  State<ReviewsTab> createState() => _ReviewsTabState();
}

class _ReviewsTabState extends State<ReviewsTab> {
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
                    "Based on ${widget.reviewCount.toString()} reviews",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.overallRating.toString(),
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
                      widget.fiveStars.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(4),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.fourStars.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(3),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.threeStars.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(2),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.twoStars.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  Row(children: [
                    StarDisplay(1),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      widget.oneStar.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ]),
                  const SizedBox(height: 20),
                  widget.reviewCount == 0
                      ? const Text(
                          "Be the first to review this product",
                          style: TextStyle(fontSize: 18),
                        )
                      : const Text(""),
                  const SizedBox(height: 20),
                  ReviewForm(),
                  const SizedBox(height: 20),
                  widget.reviewCount == 0
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
