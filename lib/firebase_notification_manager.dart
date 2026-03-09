import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationManager {
  static void _onMessage(RemoteMessage message) {
    print(message.data);
    print(message.notification?.title);
    print(message.notification?.body);
  }

  static Future<String?> getFcmToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }

  static Future<void> onRefreshToken() async {
    FirebaseMessaging.instance.onTokenRefresh.listen((String? token) {});
  }

  static Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission();

    //on background
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessage);

    //on foreground
    FirebaseMessaging.onMessage.listen(_onMessage);

    //on terminated
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  print('Got a new message');
}
