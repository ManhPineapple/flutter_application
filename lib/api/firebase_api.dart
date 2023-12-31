import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application/application/setting_service.dart';
import 'package:flutter_application/controller/notificationController.dart';
import 'package:flutter_application/data/setting_repository.dart';
import 'package:flutter_application/domain/notification.dart';

class FirebaseAPI {
  final _firebaseMessaging = FirebaseMessaging.instance;

  NotificationController notiCrtl = NotificationController();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();

    SettingService setting =
        new SettingService(settingRepository: new SettingRepositoryImpl());

    FirebaseMessaging.onMessage.listen((message) {

      Noti noti = Noti.fromJson(message.data);

      notiCrtl.addNotification(noti);
    });
    setting.setDevToken(fCMToken!);
    // gui fireBase
  }
}
