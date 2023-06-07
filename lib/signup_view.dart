import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signc/custom_button.dart';
import 'package:signc/custom_text_field.dart';
import 'package:signc/home_view.dart';
import 'package:signc/login_view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: SizedBox(
                height: 50,
                child: Container(
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
                )),
          ),
          Form(
            key: formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SignUp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => HomeView(),
                                ));
                          },
                          child: Text('Skip'))
                    ],
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
                        auth.createUserWithEmailAndPassword(
                            email: email!, password: password!);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, "The password provided is too weak.");
                        } else if (e.code == 'email-already-in-use') {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'The account already exists for that email.'),
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
                          // showSnackBar(context, "The account already exists for that email.");
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    name: 'SignUp',
                    color: const Color(0xFF2196F3),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already Have Account ?",
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
                                builder: (BuildContext context) => LogInView(),
                              ));
                        },
                        child: const Text(
                          "LOGIN",
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
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.65,
          size.width * 0.5, size.height * 0.75)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.85,
          size.width * 1.0, size.height * 0.75)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
