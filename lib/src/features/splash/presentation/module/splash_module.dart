import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_obra_mobile/src/core/binds/core_bindings.dart';
import 'package:gestao_obra_mobile/src/features/splash/presentation/controller/splash_page_controller.dart';
import 'package:gestao_obra_mobile/src/features/splash/presentation/module/splash_pages.dart';
import 'package:gestao_obra_mobile/src/features/splash/presentation/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CoreBindings(),
      ];

  @override
  void binds(Injector i) {
    i.addLazySingleton<SplashPageController>(SplashPageController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(SplashPages.main, child: (context) => const SplashPage());
  }
}
