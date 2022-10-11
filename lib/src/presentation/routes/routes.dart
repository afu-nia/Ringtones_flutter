import 'package:get/get.dart';
import 'package:ringtones_flutter/src/bindings/fav_binding.dart';
import 'package:ringtones_flutter/src/bindings/home_binding.dart';
import 'package:ringtones_flutter/src/bindings/search_binding.dart';
import 'package:ringtones_flutter/src/bindings/splash_binding.dart';
import 'package:ringtones_flutter/src/presentation/pages/fav_page/fav_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/search_page/search_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/splash_page/splash_page.dart';

const splashPage = '/splash';
const homePage = '/home';
const favPage = '/favPage';
const searchPage = '/searchPage';

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
      name: searchPage,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: favPage,
      page: () => FavPage(),
      binding: FavBinding(),
    ),
  ];
}
