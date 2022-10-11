import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/search_page/search_controller.dart';

class SearchBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SearchController(
        repositoryInterface: Get.find(),
      ),
    );
  }
}
