import 'package:get/get.dart';
import 'package:ringtones_flutter/src/bindings/fav_binding.dart';
import 'package:ringtones_flutter/src/bindings/home_binding.dart';
import 'package:ringtones_flutter/src/bindings/single_binding.dart';
import 'package:ringtones_flutter/src/bindings/splash_binding.dart';
import 'package:ringtones_flutter/src/presentation/pages/fav_page/fav_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/single_page/single_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/splash_page/splash_page.dart';

const splashPage = '/splash';
const homePage = '/home';
const singlePage = '/Single';
const favPage = '/favPage';

class Routes {
  static final pages = [
    GetPage(
      name: splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: singlePage,
      page: () => SinglePage(),
      binding: SingleBinding(),
    ),
    GetPage(
      name: favPage,
      page: () => FavPage(),
      binding: FavBinding(),
    ),
  ];
}
