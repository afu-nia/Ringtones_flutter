import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';
import 'package:ringtones_flutter/src/presentation/routes/routes.dart';

class SplashController extends GetxController {
  late RepositoryInterface repositoryInterface;
  SplashController({required this.repositoryInterface});

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(homePage);
    });
    // super.onReady();
  }
}
