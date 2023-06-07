import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:signc/signup_view.dart';

import 'home_view.dart';
import 'login_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late Animation<Offset> slidingAnimation;
  var data;

  static getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getBool('flag'));
    return sharedPreferences.getBool('flag');
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 20), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    Future.delayed(
      const Duration(seconds: 4),
      () async {
        // Get.to(()=>HomeView(),
        //     transition: Transition.fade,duration: Duration(milliseconds: 250),
        // );
        if (await getUserData()) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomeView(),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LogInView(),
              ));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 248, 249, 250),
          Color.fromARGB(255, 194, 215, 248),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            width: 220,
            child: Image.asset(
              'assets/images/Final Blue.png',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          AnimatedBuilder(
              animation: slidingAnimation,
              builder: (context, _) {
                return SlideTransition(
                  position: slidingAnimation,
                  child: const Text(
                    'Welcome To SignC',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0)),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
