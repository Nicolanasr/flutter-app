import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    return Colors.blue;
  }

  _launchURL() async {
    const url = 'https://urbeys.com/?page_id=3';
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: DefaultTextStyle(
        style: TextStyle(color: Colors.blueGrey[900]),
        child: Scaffold(
          appBar: AppBarMod(),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 23),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        width: 65,
                        child: Divider(
                          thickness: 2,
                          color: Colors.blue[900],
                          height: 10,
                        ),
                      ),
                      const Divider(
                        thickness: 0.5,
                        height: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      'Create new account today to reap the benefits of a personalized shopping experience.'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'E-mail address *',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Username';
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
                    height: 20,
                  ),
                  const Text(
                    'Password *',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
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
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.w300),
                        text:
                            'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our ',
                        children: [
                          TextSpan(
                              text: ' privacy policy',
                              style: TextStyle(color: Colors.blue[800]),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchURL();
                                }),
                          const TextSpan(text: '.')
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Review sent')));
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: const Text("Register"))),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: Colors.blueGrey[900]),
                          children: [
                        TextSpan(
                            text: ' Login ',
                            style: TextStyle(color: Colors.blue[800]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                              }),
                        TextSpan(
                            style: TextStyle(color: Colors.blueGrey[900]),
                            text: 'to continue')
                      ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
