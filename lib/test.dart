import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signc/signup_view.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';
import 'home_view.dart';

class WaveBackgroundPage extends StatefulWidget {
  @override
  _WaveBackgroundPageState createState() => _WaveBackgroundPageState();
}

class _WaveBackgroundPageState extends State<WaveBackgroundPage> {
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: ClipPath(
                clipper: WaveShape(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  color: Colors.lightGreen,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipPath(
                clipper: BottomWaveShape(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  color: Colors.lightGreen,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color(0xFF42A5F5),
                  Color(0xFF90CAF9),
                  Color(0xFFA1C4FD),
                  Color(0xFFCAE9F5),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'LogIn',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            hintText: 'Enter Your Email',
                            title: "email",
                            icon: const Icon(Icons.email_outlined),
                            onChanged: (data) {
                              email = data;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            hintText: 'Enter Your Password',
                            title: "Password",
                            icon: const Icon(Icons.lock),
                            onChanged: (data) {
                              password = data;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            ontap: () async {
                              try {
                                var auth = FirebaseAuth.instance;
                                auth
                                    .signInWithEmailAndPassword(
                                        email: email!, password: password!)
                                    .then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const HomeView(),
                                        )));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: const Text(
                                            'No user found for that email.'),
                                        actions: [
                                          TextButton(
                                            child: const Text('Close'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  // showSnackBar(context, "No user found for that email.");
                                }
                              }
                            },
                            name: 'LogIn',
                            color: const Color(0xFF2196F3),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't Have Account ?",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUpView(),
                                      ));
                                },
                                child: const Text(
                                  "SignUp",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WaveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(width * 1 / 2, 0, width * 2 / 4, height, width, height);
    p.lineTo(width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class BottomWaveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(width * 1 / 2, 0, width * 2 / 4, height, width, height);
    p.lineTo(0, height);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
