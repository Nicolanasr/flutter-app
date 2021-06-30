import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  Function updateRating;

  StarRating(this.updateRating);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      glow: false,
      itemSize: 30.00,
      initialRating: 0,
      minRating: 0,
      maxRating: 5,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        updateRating(rating);
      },
    );
  }
}


// class StarRating extends StatefulWidget {
  

//   @override
//   State<StarRating> createState() => _StarRating();
// }

// class _StarRating extends State<StarRating> {
//   @override
//   Widget build(BuildContext context) {
//     return RatingBar.builder(
//       glow: false,
//       itemSize: 30.00,
//       initialRating: 0,
//       minRating: 0,
//       direction: Axis.horizontal,
//       itemCount: 5,
//       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//       itemBuilder: (context, _) => const Icon(
//         Icons.star,
//         color: Colors.amber,
//       ),
//       onRatingUpdate: (rating) {
//         _updateRating(rating);
//       },
//     );
//   }
// }
