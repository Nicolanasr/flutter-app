import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int value;
  StarDisplay(this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value
            ? const Icon(
                Icons.star,
                color: Colors.amber,
              )
            : const Icon(
                Icons.star_border,
                color: Colors.grey,
              );
      }),
    );
  }
}
