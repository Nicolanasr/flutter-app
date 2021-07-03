import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:navigation_test/app_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    return Colors.blue;
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
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
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
                  const Text('Welcome back! Sign in to your account.'),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Username or email address *',
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
                    height: 10,
                  ),
                  SizedBox(
                    height: 20,
                    child: GestureDetector(
                      onTap: () {
                        print('password reset');
                      },
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.blue[800]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                            child: Checkbox(
                              splashRadius: 17,
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          const Text('Remember me'),
                        ],
                      ),
                    ),
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
                          child: const Text("Login"))),
                  const SizedBox(
                    height: 15,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account yet?',
                          style: TextStyle(color: Colors.blueGrey[900]),
                          children: [
                        TextSpan(
                            text: ' Create one today ',
                            style: TextStyle(color: Colors.blue[800]),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _formKey.currentState!.reset();
                                Navigator.pushNamed(context, '/register');
                              }),
                        TextSpan(
                            style: TextStyle(color: Colors.blueGrey[900]),
                            text:
                                'to reap the benefits of a personalized shopping experience.')
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
