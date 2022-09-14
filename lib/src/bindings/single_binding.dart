import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/single_page/single_controller.dart';

class SingleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SingleController(
        repositoryInterface: Get.find(),
      ),
    );
  }
}
