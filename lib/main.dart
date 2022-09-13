import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/main_binding.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/local_storage.dart';
import 'package:ringtones_flutter/src/presentation/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
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
      initialRoute: homePage,
      getPages: Routes.pages,
      initialBinding: MainBinding(),
    );
  }
}
