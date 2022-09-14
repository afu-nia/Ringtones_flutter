import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';
import 'package:ringtones_flutter/src/presentation/routes/routes.dart';
import 'package:ringtones_flutter/src/presentation/widgets/menu_item.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: Get.size.height * 0.15,
                  bottom: Get.size.height * 0.1,
                  //left: Get.size.width * 0.0,
                  right: Get.size.width * 0.1,
                ),
                child: Card(
                  elevation: 2.0,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  shadowColor: textColor.withOpacity(0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      fit: BoxFit.cover,
                      'https://www.pintomicasa.com/img/2016/10/Rosa-azul-728x544.jpg',
                      height: 120,
                      width: 120,
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: Get.size.width * 0.001),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        menuItem(
                          function: () {
                            _homeController.repositoryInterface.changeTheme();
                            ZoomDrawer.of(context)!.close();
                          },
                          icon: Icons.nightlight_outlined,
                          title: 'Tema',
                          iconColor: iconsColor,
                        ),
                        menuItem(
                          function: () {
                            _homeController.repositoryInterface.changeTheme();
                            ZoomDrawer.of(context)!.close();
                          },
                          icon: Icons.favorite_outline,
                          title: 'Favoritos',
                          iconColor: iconsColor,
                        ),
                        menuItem(
                          function: () {
                            _homeController.repositoryInterface.changeTheme();
                            ZoomDrawer.of(context)!.close();
                          },
                          icon: Icons.help_center_outlined,
                          title: 'Centro de ayuda',
                          iconColor: iconsColor,
                        ),
                        menuItem(
                          function: () {
                            _homeController.repositoryInterface.changeTheme();
                            ZoomDrawer.of(context)!.close();
                          },
                          icon: Icons.privacy_tip_outlined,
                          title: 'Politicas de privacidad',
                          iconColor: iconsColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
