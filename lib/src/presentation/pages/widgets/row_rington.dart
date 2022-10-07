import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/utils/split_name.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';
import 'package:ringtones_flutter/src/presentation/widgets/image_util.dart';

Widget rowRigton({
  required RingtonModel ringtonModel,
  required Function() function,
}) {
  return GestureDetector(
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        color: menuBackgroundColor.withOpacity(0.07),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                child: Hero(
                  tag: 'bottom-${ringtonModel.name!}',
                  child: imageUtil(
                    image: '${ringtonModel.image}',
                    scaleW: 0.18,
                    scaleH: 0.1,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.size.width * 0.65,
                  child: Text(
                    SplitName.splitName(name: ringtonModel.name!),
                    style: boldText(),
                  ),
                ),
                SizedBox(
                  height: Get.size.height * 0.001,
                ),
                SizedBox(
                  width: Get.size.width * 0.65,
                  child: Text(
                    SplitName.splitName(name: ringtonModel.name!),
                    style: normalText(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
