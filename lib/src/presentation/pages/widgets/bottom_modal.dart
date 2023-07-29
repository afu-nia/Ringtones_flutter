import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/audio_services.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/utils/split_name.dart';
import 'package:ringtones_flutter/src/presentation/pages/home_page/home_controller.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/sleek_circular.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';
import 'package:ringtones_flutter/src/presentation/widgets/menu_single.dart';

bottomModalBar({
  required BuildContext buildContext,
  required RingtonModel ringtonModel,
  required String tag,
  required String id,
}) {
  showBarModalBottomSheet(
    context: buildContext,
    builder: (context) {
      initAdudioPlayer(
        index: 1,
        urlAudio: '$ringtoneUrl${ringtonModel.pathRington}',
        urlImage: ringtonModel.image!,
        name: SplitName.splitName(name: ringtonModel.name!),
      );

      return Stack(
        children: [
          Positioned.fill(
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: 16,
                sigmaY: 16,
              ),
              child: Image.network(
                '${ringtonModel.image}',
                fit: BoxFit.cover,
                height: Get.size.height,
                width: Get.size.width,
              ),
            ),
          ),
          Center(
            child: sleekCircular(
                tag: tag,
                name: ringtonModel.name!,
                image: '${ringtonModel.image}'),
          ),
          Positioned(
            top: Get.size.height * 0.7,
            left: Get.size.width * .03,
            right: Get.size.width * .03,
            child: SizedBox(
              width: Get.size.width * 0.65,
              child: Text(
                SplitName.splitName(name: ringtonModel.name!),
                style: customBoldText(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned.fill(
            top: Get.size.height * 0.83,
            left: Get.size.width * 0.05,
            right: Get.size.width * 0.05,
            bottom: 0.0,
            child: Card(
              color: menuBackgroundColor.withOpacity(0.6),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(14.0),
                ),
              ),
              elevation: 5,
              child: menuSingle(ringtonModel: ringtonModel, id: id),
            ),
          ),
        ],
      );
    },
    enableDrag: true,
  );
}
