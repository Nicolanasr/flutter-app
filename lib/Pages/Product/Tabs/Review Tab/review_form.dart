import 'package:flutter/material.dart';
import 'package:navigation_test/Pages/Product/Tabs/Review%20Tab/star_rating.dart';

class ReviewForm extends StatefulWidget {
  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  int rating = 0;

  void updateRating(double r) {
    setState(() {
      rating = r.round();
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 4),
              child: Text("Rating: ${rating.toString()}/5")),
          StarRating(updateRating),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your review",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              maxLines: null,
              minLines: 3,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Name *",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Name';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              )),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "E-mail *",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your E-mail address';
                } else if (!value.contains('@') || !value.contains('.')) {
                  return 'Please enter a valid E-mail address';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              )),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Review sent')));
                  }
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text("Add review"))),
          )
        ],
      ),
    );
  }
}
