import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:picolo/offline.dart';
import 'package:picolo/screens/login_screen.dart';
import 'package:picolo/screens/splash_screen.dart';
import 'package:picolo/text_entry_list.dart';

import 'common/route_list.dart';
import 'common/utils/internet_connectivity.dart';
import 'home_screen.dart';

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> appInitialModules() async {
    // Constants.analyticsEvent = AnalyticsEvent();
    // Constants.analyticsEvent.setIsAppOpen();
    // Constants.analyticsEvent.sendAnalyticsEvent(AnalyticsEvents.appOpen);
    // PushNotification.initiateLocalNotification();
    // await PushNotification.listenToken();
    // Constants.analyticsEvent = AnalyticsEvent.getSingleton;
    checkInternetConnection();
    // initialEvents();
  }

  void checkInternetConnection() {
    if (kIsWeb) {
      return;
    }
    MyConnectivity.instance.initialise();
    MyConnectivity.instance.myStream.listen((onData) {
      log('[App] internet issue change: $onData');
      if (onData.entries.first.value == false) {
        Get.toNamed(RouteList.offline);
      } else {
        if (Get.currentRoute == RouteList.offline) {
          Get.offAllNamed(Get.previousRoute);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Picolo',
      debugShowCheckedModeBanner: false,
      enableLog: true,
      getPages: [
        GetPage(name: RouteList.offline, page: () => Offline()),
        GetPage(name: RouteList.login, page: () => LoginScreen()),
        GetPage(name: RouteList.splashscreen, page: () => SplashScreen()),
        GetPage(name: RouteList.home, page: () => HomeScreen()),
        GetPage(name: RouteList.textEntryList, page: () => TextEntryList()),
      ],
      // navigatorObservers: <NavigatorObserver>[observer],

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteList.textEntryList,
    );
  }
}
