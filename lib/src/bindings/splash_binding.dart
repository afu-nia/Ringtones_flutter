import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/splash_page/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SplashController(
        repositoryInterface: Get.find(),
      ),
    );
  }
}
