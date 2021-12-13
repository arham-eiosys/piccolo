import 'package:get/get.dart';
import 'package:picolo/common/route_list.dart';
import 'package:picolo/utils/local_storage.dart';

class SplashscreenController extends GetxController {
  Future navigateToRoute() async {
    await LocalStorage.clearStorage();
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(RouteList.login);
    });
    // if (await LocalStorage.hasTutorialSeen()) {
    //   if (await LocalStorage.getPincode() != null) {
    //     if (await LocalStorage.getUser() != null) {
    //       if (Constants.user.fullName != null) {
    //         await Constants().getUserInfo();
    //         goToHome();
    //       } else {
    //         goToRegisterForm();
    //       }
    //     } else {
    //       await LocalStorage.getOTPRequestCount();
    //       goToLogin();
    //     }
    //   } else {
    //     await loadImage(AssetImages.pincodeBackground);
    //     goToPincode();
    //   }
    // } else {
    //   await loadImage(AssetImages.oboardingFirst);
    //   goToOnboarding();
    // }
  }
  //
  // void goToRegisterForm() {
  //   Get.offNamed(RouteList.registrationForm);
  // }
  //
  // void goToHome() {
  //   eventBus.fire(const EventUserLogin());
  // }
  //
  // void goToPushNotification() {
  //   Get.toNamed(RouteList.notification);
  // }
  //
  // void goToLogin() {
  //   Get.offNamed(RouteList.login);
  // }
  //
  // void goToPincode() {
  //   Get.offNamed(RouteList.pincode);
  // }
  //
  // void goToOnboarding() {
  //   Get.offNamed(RouteList.onboarding);
  // }
}
