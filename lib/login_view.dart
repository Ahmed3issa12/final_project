import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signc/custom_button.dart';
import 'package:signc/custom_text_field.dart';
import 'package:signc/home_view.dart';
import 'package:signc/services/auth.dart';
import 'package:signc/signup_view.dart';

class LogInView extends StatefulWidget {
  LogInView({Key? key}) : super(key: key);
  static const IconData fingerprint =
      IconData(0xe287, fontFamily: 'MaterialIcons');

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  static Future<bool> saveUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print('User Added');
    return await sharedPreferences.setBool('flag', true);
  }

  @override
  void initState() {
    fingerAuth();
    super.initState();
  }

  Future<void> fingerAuth() async {
    bool isAuthenticated = await AuthService.authenticateUser();
    if (isAuthenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
      saveUserData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Authentication failed.'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignUpView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
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
                              content:
                                  const Text('No user found for that email.'),
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
                              builder: (BuildContext context) => SignUpView(),
                            ));
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                InkWell(
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF1565C0),
                      child: Icon(
                        LogInView.fingerprint,
                        size: 40,
                      ),
                    ),
                    onTap: () async {
                      fingerAuth();
                    }),
              ],
            ),
          ),
        ),
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
      ),
    );
  }
}
