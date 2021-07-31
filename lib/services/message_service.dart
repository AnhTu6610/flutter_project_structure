import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';

Future myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print("***********************************************");
}

Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
  // StateManager.navigatorKey.currentState.pushNamed("/notification");
}
Future onSelectNotification(String? playload) async {}

class MessageService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  MessageService() {
    var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/launcher_icon');
    var initializationSettingsIOS = new IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: onSelectNotification);

    messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Logger().e(message.notification.toString());
      if (message.notification != null) {
        showNotificationWithSound(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Logger().e(message.notification.toString());
      onSelectNotification("###");
    });
    // FirebaseMessaging.onBackgroundMessage((message) => null);
  }

  static Future<String?> tokenFcm() async {
    try {
      String? fcmToken = await messaging.getToken();
      print("Token FCM: $fcmToken");
      return fcmToken;
    } catch (e) {
      print(e);
      print("ERROR: get token fcm error");
    }
  }

  static Future resetToken() async {
    await messaging.deleteToken();
  }

  static Future showNotificationWithSound(RemoteMessage message) async {
    Logger().e(message.data);
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'Channel Id',
      'Channel Name',
      'Channel Description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: false,
    );
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails(presentSound: true, presentAlert: true, presentBadge: true);
    var platformChannelSpecifics = new NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    String title = message.notification?.title ?? "";
    String boddy = message.notification?.body ?? "";
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      boddy,
      platformChannelSpecifics,
      payload: "",
    );
  }
}
