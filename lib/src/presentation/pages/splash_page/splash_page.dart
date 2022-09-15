import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/presentation/pages/splash_page/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);
  final SplashController _splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
