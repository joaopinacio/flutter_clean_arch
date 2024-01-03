import 'package:flutter_modular/flutter_modular.dart';
import 'package:gestao_obra_mobile/src/features/splash/presentation/module/splash_pages.dart';

typedef Json = Map<String, dynamic>;

/// The routes of Splash
///
/// The routes are used to navigate between the pages of the Splash.
///
/// The routes are:
/// * [CreationMicroAppPages.main] - The main page
class SplashRoutes {
  const SplashRoutes._();

  static const String module = '/splash';

  /// Navigates to the main page.
  ///
  /// The [args] is the args.
  static void toMain(Json? draft) => Modular.to.navigate('$module${SplashPages.main}', arguments: draft);
}
