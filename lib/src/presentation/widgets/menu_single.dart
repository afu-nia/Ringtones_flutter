import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/audio_services.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';

Widget menuSingle({
  RingtonModel? ringtonModel,
  required String id,
}) {
  HomeController homeController = Get.find();
  homeController.isFav(id: id);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: () {
          stop();
          //exit();
          homeController.isPlaying(false);
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: iconsColor,
          size: 36,
        ),
      ),
      GestureDetector(
        onTap: homeController.playController,
        child: Obx(
          () => Icon(
            homeController.isPlaying.isTrue ? Icons.pause : Icons.play_arrow,
            color: iconsColor,
            size: 64,
          ),
        ),
      ),
      GestureDetector(
        onTap: () => homeController.addFavController(
          id: id,
          ringtonModel: ringtonModel,
        ),
        child: Obx(
          () => Icon(
            Icons.favorite,
            color:
                homeController.isFavIcon.isTrue ? Colors.redAccent : iconsColor,
            size: 36,
          ),
        ),
      ),
    ],
  );
}
