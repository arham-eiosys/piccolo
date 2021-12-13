import 'package:flutter/material.dart';

class Offline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: const Color(0xFFEE4400),
                  child: const Center(
                    child: Text('offline', style: TextStyle(fontSize: 14)),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/no-internet.png', height: 300),
                    const SizedBox(height: 20),
                    const Text(
                      'No Internet!',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'You need an active internet connection\nto perform KYC verification.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff949393),
                      ),
                    ),
                    const SizedBox(height: 50),
                    // Button(
                    //     title: "Try Again",
                    //     onPressed: () {
                    //       setState(() {});
                    //     })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
