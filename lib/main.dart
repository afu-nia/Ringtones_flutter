import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/main_binding.dart';
import 'package:ringtones_flutter/src/presentation/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: splashPage,
      getPages: Routes.pages,
      initialBinding: MainBinding(),
    );
  }
}
