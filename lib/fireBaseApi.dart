import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  FirebaseInAppMessaging fiam = FirebaseInAppMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print('TOKEN: $FCMToken');
  }

  void initializeFirebaseInAppMessaging() {
    fiam.triggerEvent('V');
  }
}