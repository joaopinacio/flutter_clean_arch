import 'package:gestao_obra_mobile/src/core/services/notification/notification.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class AppNotificationHandler implements AppNotification {
  @override
  Future<void> optIn() async {
    await OneSignal.Location.setShared(true);
    await OneSignal.User.pushSubscription.optIn();
  }

  @override
  Future<void> optOut() async {
    await OneSignal.Location.setShared(false);
    await OneSignal.User.pushSubscription.optOut();
    OneSignal.Notifications.removeClickListener(_onNotificationClickListener);
  }

  @override
  void addClickListener() {
    OneSignal.Notifications.addClickListener(_onNotificationClickListener);
  }

  void _onNotificationClickListener(OSNotificationClickEvent event) {
    /// TODO: Implementar ação ao clicar na notificação
  }
}
