import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_obra_mobile/src/core/binds/core_bindings.dart';
import 'package:gestao_obra_mobile/src/features/splash/presentation/module/splash_module.dart';

class AppModule extends Module {
  final transition = TransitionType.rightToLeftWithFade;

  @override
  void exportedBinds(Injector i) {
    CoreBindings();
  }

  @override
  List<Module> get imports => [
        CoreBindings(),
      ];

  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      module: SplashModule(),
      transition: transition,
    );
    // ..module(
    //   HomeRoutes.module,
    //   module: HomeModule(),
    //   transition: transition,
    // );
  }
}
