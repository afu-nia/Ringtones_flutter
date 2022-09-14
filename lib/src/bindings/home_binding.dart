import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        repositoryInterface: Get.find(),
      ),
    );
  }
}
