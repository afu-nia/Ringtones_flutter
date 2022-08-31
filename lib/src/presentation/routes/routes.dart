import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/splash_page/splash_page.dart';

const splashPage = '/splash';
const homePage = '/home';

class Routes {
  static final pages = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
    ),
  ];
}
