import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ringtones_flutter/src/presentation/pages/main_page.dart';
import 'package:ringtones_flutter/src/presentation/widgets/menu_drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: zoomDrawerController,
        menuScreen: const MenuDrawer(),
        mainScreen: const MainPage(),
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        androidCloseOnBackTap: true,
        mainScreenTapClose: true,
        menuScreenTapClose: true,
        borderRadius: 24.0,
        showShadow: false,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.pink,
        menuBackgroundColor: Colors.blue,
      ),
    );
  }
}
