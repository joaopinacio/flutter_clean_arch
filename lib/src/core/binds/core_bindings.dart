import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_obra_mobile/src/core/services/http_client/app_http.dart';
import 'package:gestao_obra_mobile/src/core/services/local_storage/local_storage.dart';
import 'package:gestao_obra_mobile/src/core/services/local_storage/local_storage_impl.dart';
import 'package:gestao_obra_mobile/src/core/services/notification/notification.dart';
import 'package:gestao_obra_mobile/src/core/services/notification/notification_impl.dart';

class CoreBindings extends Module {
  @override
  void exportedBinds(Injector i) {
    i
      // SERVICES
      ..addSingleton<LocalStorage>(LocalStorageImpl.new)
      ..addSingleton<AppNotification>(AppNotificationHandler.new)
      ..addSingleton<AppHttp>(AppHttp.new);
  }
}
