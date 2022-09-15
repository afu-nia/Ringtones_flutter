import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';
import 'package:ringtones_flutter/src/presentation/pages/single_page/single_page.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/card_widget.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/row_rington.dart';
import 'package:ringtones_flutter/src/presentation/routes/routes.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final HomeController _homeController = Get.find();
  ScrollController _scrollController = ScrollController();

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
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          controller: _scrollController,
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
                      ringtonModel: ringtonModel,
                      function: () {
                        showBarModalBottomSheet(
                          context: context,
                          builder: (context) => Center(
                            child: Hero(
                              tag: 'top-${ringtonModel.name!}',
                              child: Image.network(
                                  'https://www.pintomicasa.com/img/2016/10/Rosa-azul-728x544.jpg'),
                            ),
                          ),
                          enableDrag: true,
                        );
                        // print(ringtonModel.name);
                        // Get.to(
                        //   SinglePage(
                        //     args1: [ringtonModel, 'top-${ringtonModel.name!}'],
                        //   ),
                        // );
                      },
                    ); //cardWidget();
                  },
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                controller: _scrollController,
                itemCount: _homeController.ringtons.isEmpty
                    ? 0
                    : _homeController.ringtons.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  RingtonModel ringtonModel = _homeController.ringtons[index];
                  return rowRigton(
                    ringtonModel: ringtonModel,
                    function: () {
                      showBarModalBottomSheet(
                        context: context,
                        builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Hero(
                                tag: 'bottom-${ringtonModel.name!}',
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(24.0),
                                      bottomRight: Radius.circular(24.0)),
                                  child: Image.network(
                                    'https://www.pintomicasa.com/img/2016/10/Rosa-azul-728x544.jpg',
                                    height: Get.size.height * 0.6,
                                    width: Get.size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        enableDrag: true,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
