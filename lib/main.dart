import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/main_binding.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/audio_services.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/local_preferences_storage.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/presentation/routes/routes.dart';
import 'package:ringtones_flutter/src/presentation/theme/theme_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalPreferencesStorage.configurePrefs();
  await initAudioServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeServices().theme,
      initialRoute: homePage,
      getPages: Routes.pages,
      initialBinding: MainBinding(),
    );
  }
}
