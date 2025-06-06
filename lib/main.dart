// ignore_for_file: depend_on_referenced_packages, avoid_print, use_build_context_synchronously

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:school_management_system/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  try {
    await _initializeApp();
    runApp(Phoenix(child: const MyApp()));
  } catch (e) {
    debugPrint('Error initializing app: $e');
  }
}

Future<void> _initializeApp() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await _initializeFirebaseWeb();
  } else {
    await _initializeFirebaseMobile();
  }
}

Future<void> _initializeFirebaseWeb() async {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBrqsWGI_6CrOkZnG1qTM7CiUcpWUtv2Rw',
      appId: '1:276187423017:web:c977a55eb9088fbff11738',
      messagingSenderId: '276187423017',
      projectId: 'school-management-system-6b1c2',
      storageBucket: 'school-management-system-6b1c2.appspot.com',
    ),
  );
}

Future<void> _initializeFirebaseMobile() async {
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await FlutterDownloader.initialize(debug: true);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupFirebaseMessaging();
  }

  void _setupFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpened);
  }

  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      _showNotification(
        notification.hashCode,
        notification.title,
        notification.body,
      );
    }
  }

  void _handleMessageOpened(RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      _showMessageDialog(notification);
    }
  }

  void _showNotification(int id, String? title, String? body) {
    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          color: Colors.blue,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

  void _showMessageDialog(RemoteNotification notification) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(notification.title ?? ''),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(notification.body ?? ''),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: AppPages.Splashscreen,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'RedHatDisplay-Medium'),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
