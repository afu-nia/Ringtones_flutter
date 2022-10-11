import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/fav_page/fav_controller.dart';

class FavBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FavController(
        repositoryInterface: Get.find(),
      ),
    );
  }
}
