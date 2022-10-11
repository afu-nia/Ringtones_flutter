import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/bottom_modal.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/card_widget.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/row_rington.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';
import 'package:skeletons/skeletons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final HomeController _homeController = Get.find();
  final ScrollController _scrollController = ScrollController();

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
          child: const Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search, size: 32),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.all(_homeController.isLoading.isTrue ? 0.0 : 6.0),
          child: Obx(
            () => _homeController.isLoading.isTrue
                ? SkeletonListView(
                    itemCount: 3,
                    scrollable: true,
                    item: SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                        lines: 1,
                        spacing: 0,
                        lineStyle: SkeletonLineStyle(
                            randomLength: false,
                            height: Get.size.height * 0.35,
                            borderRadius: BorderRadius.circular(8),
                            alignment: Alignment.center),
                      ),
                    ),
                  )
                : ListView(
                    controller: _scrollController,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Ultimos Tonos',
                            style: boldText(fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.size.height * 0.35,
                        width: Get.size.width,
                        child: Obx(
                          () => _homeController.ringtons.isEmpty
                              ? SkeletonListView(
                                  itemCount: 5,
                                )
                              : ListView.builder(
                                  itemCount: _homeController.ringtons.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    RingtonModel ringtonModel =
                                        _homeController.ringtons[index];
                                    return cardWidget(
                                      ringtonModel: ringtonModel,
                                      function: () {
                                        bottomModalBar(
                                          buildContext: context,
                                          ringtonModel: ringtonModel,
                                          tag: 'top',
                                          //homeController: _homeController,
                                          // index: index.toString(),
                                        );
                                      },
                                    );
                                  },
                                ),
                        ),
                      ),
                      Obx(
                        () => ListView.builder(
                          controller: _scrollController,
                          itemCount: _homeController.ringtons.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            RingtonModel ringtonModel =
                                _homeController.ringtons[index];
                            return rowRigton(
                              ringtonModel: ringtonModel,
                              function: () {
                                bottomModalBar(
                                  buildContext: context,
                                  ringtonModel: ringtonModel,
                                  tag: 'bottom',
                                  //homeController: _homeController,
                                  // index: index.toString(),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
