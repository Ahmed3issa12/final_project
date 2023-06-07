import 'package:flutter/material.dart';
import 'package:signc/sign.dart';
import 'package:signc/text_detector_view.dart';

import 'currency.dart';
import 'object_detector_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF42A5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SignC',
          style: TextStyle(
              color: Color(0xFF2196F3),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF42A5F5),
            Color(0xFF90CAF9),
            Color(0xFFA1C4FD),
            Color(0xFFCAE9F5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignPage()));
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    child: Card(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFFCAE9F5),
                                radius: 60,
                              ),
                              Positioned(
                                top: 5,
                                left: 2,
                                right: 2,
                                bottom: 5,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/asl.png'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'ASL Detection',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrencyPage()));
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    child: Card(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFFCAE9F5),
                                radius: 60,
                              ),
                              Positioned(
                                top: 5,
                                left: 2,
                                right: 2,
                                bottom: 5,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/currency.png'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Currency Detection',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ObjectDetectorView()));
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    child: Card(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFFCAE9F5),
                                radius: 60,
                              ),
                              Positioned(
                                top: 5,
                                left: 2,
                                right: 2,
                                bottom: 5,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/object detection.jpg'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Object Detection',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TextRecognizerView()));
                  },
                  child: Container(
                    width: 170,
                    height: 200,
                    child: Card(
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(
                          17,
                        ),
                      ),
                      elevation: 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFFCAE9F5),
                                radius: 60,
                              ),
                              Positioned(
                                top: 5,
                                left: 2,
                                right: 2,
                                bottom: 5,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      'assets/images/text extractin 2.png'),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Text Detection',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
