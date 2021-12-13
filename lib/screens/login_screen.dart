import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:get/get.dart';
import 'package:picolo/common/route_list.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        onRecoverPassword: (String a) {},
        onLogin: (LoginData a) {
          Get.toNamed(RouteList.textEntryList);
        },
        onSignup: (LoginData a) {},
        logoTag: "Picolo",
        title: "Picolo",
        hideForgotPasswordButton: true,
        hideSignUpButton: true,
        // showDebugButtons: true,
      ),
    );
  }
}
