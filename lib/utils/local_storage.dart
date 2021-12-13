import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

// storage clear
  static Future clearStorage() async {
    await storage.deleteAll();
  }

  static Future setAccessToken(String token) async {
    // if (token != null) {
    //   Constants.accessToken = token;
    //   await storage.write(key: 'accessToken', value: token);
    // }
  }

  // static Future<String> getAccessToken() async {
  //   // return Constants.accessToken = await storage.read(key: 'accessToken');
  // }

  static Future removeAccessToken() async {
    // Constants.accessToken = null;
    await storage.delete(key: 'accessToken');
  }

// check tutorial seen or not
//   static Future<Pincode> getPincode() async {
//     if (await storage.read(key: 'pincode') != null) {
//       return Constants.pincode = Pincode.fromJson(json
//           .decode(await storage.read(key: 'pincode')) as Map<String, dynamic>);
//     }
//     return null;
//   }

// set tutorial seen
//   static Future setPincode(Map<String, dynamic> pincode) async {
//     Constants.pincode = Pincode.fromJson(pincode);
//     await storage.write(key: 'pincode', value: json.encode(pincode));
//   }

  // static Future<void> setOTPRequestCount(int count) async {
  //   Constants.requestedOTPCounter.update('count', (value) => count + 1);
  //   Constants.requestedOTPCounter.update('timestamp',
  //           (value) => DateTime.now().add(const Duration(minutes: 30)).toString());
  //   await storage.write(
  //       key: 'OTPRequestCount',
  //       value: json.encode(Constants.requestedOTPCounter));
  // }

  // static Future<Map<String, dynamic>> getOTPRequestCount() async {
  //   if (await storage.read(key: 'OTPRequestCount') != null) {
  //     return Constants.requestedOTPCounter =
  //     json.decode(await storage.read(key: 'OTPRequestCount'))
  //     as Map<String, dynamic>;
  //   }
  //   return null;
  // }

  // static Future<void> clearOTPRequestCount() async {
  //   Constants.requestedOTPCounter = {
  //     'count': 0,
  //     'timestamp': DateTime.now().add(const Duration(minutes: 30)).toString(),
  //   };
  //   await storage.delete(key: 'OTPRequestCount');
  // }

// check tutorial seen or not
  static Future<bool> hasTutorialSeen() async {
    return (json.decode(await storage.read(key: 'TutorialSeen') ?? 'false') ??
        false) as bool;
  }

// set tutorial seen
  static Future setTutorialSeen(bool seen) async {
    await storage.write(key: 'TutorialSeen', value: json.encode(seen));
  }

  static Future<bool> isPushAllowed() async {
    return await (json
            .decode(await storage.read(key: 'pushAllowed') ?? 'false') ??
        false) as bool;
  }

  static Future setPushAllowed(bool value) async {
    await storage.write(key: 'pushAllowed', value: json.encode(value));
  }

// set user data to storage
//   static Future setUser(Map<String, dynamic> userData) async {
//     Constants.user = User.fromJson(userData);
//     await storage.write(key: 'User', value: json.encode(userData));
//     return;
//   }

  // get user data from storage!
  // static Future<User> getUser() async {
  //   if (await storage.read(key: 'User') != null) {
  //     return Constants.user = User.fromJson(
  //         json.decode(await storage.read(key: 'User')) as Map<String, dynamic>);
  //   }
  //   return null;
  // }

  // remove user from storage!
  // static Future removeUser() async {
  //   final User userData = await getUser();
  //   await storage.delete(key: 'deviceIMEISet');
  //   await storage.delete(key: 'User');
  //   Constants.user = User();
  //   return userData;
  // }
}
