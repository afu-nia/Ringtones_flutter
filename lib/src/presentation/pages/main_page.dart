import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/card_widget.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: menuBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)!.open();
            },
            child: const Icon(Icons.menu)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Ultimos Tonos',
                  style: boldText(),
                ),
              ],
            ),
            SizedBox(
              height: Get.size.height * 0.35,
              width: Get.size.width,
              child: Obx(
                () => ListView.builder(
                  itemCount: _homeController.ringtons.isEmpty
                      ? 0
                      : _homeController.ringtons.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    RingtonModel ringtonModel = _homeController.ringtons[index];
                    return cardWidget(
                        ringtonModel: ringtonModel); //cardWidget();
                  },
                ),
              ),
            ),
            const Center(
              child: Text('HOME PAGE'),
            ),
          ],
        ),
      ),
    );
  }
}
