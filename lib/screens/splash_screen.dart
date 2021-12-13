import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picolo/common/images.dart';
import 'package:picolo/controllers/splash_screen_contoller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashscreenController controller = Get.put(SplashscreenController());

  @override
  void initState() {
    onDidload();
    super.initState();
  }

  Future onDidload() async {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      FocusManager.instance.primaryFocus!.unfocus();
      // Constants().getAppSettings();
      // Future.delayed(const Duration(seconds: 1), () {
      controller.navigateToRoute();
      // });
    });
  }

  @override
  void dispose() {
    // PushNotification().initiateFCM();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) => Center(
          child: Image.asset(
            AssetImages.splashscreen,
            fit: BoxFit.contain,
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          ),
        ),
      ),
    );
  }
}
