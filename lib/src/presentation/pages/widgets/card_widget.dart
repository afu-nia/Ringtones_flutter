import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/utils/split_name.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';
import 'package:ringtones_flutter/src/presentation/widgets/image_util.dart';

Widget cardWidget({
  required RingtonModel ringtonModel,
  required Function() function,
}) {
  return GestureDetector(
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Hero(
                tag: 'top-${ringtonModel.name!}',
                child: imageUtil(
                  image: '${ringtonModel.image}',
                  scaleH: 0.4,
                  scaleW: 0.7,
                ),
              ),
            ),
          ),
          Positioned(
            left: 3,
            right: 3,
            bottom: 3,
            top: Get.size.height * 0.17,
            child: Card(
              color: menuBackgroundColor.withOpacity(0.5),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Get.size.width * 0.5,
                          child: Text(
                            SplitName.splitName(name: ringtonModel.name!),
                            style: customBoldText(fontSize: 16),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.music_note_outlined,
                              size: 14,
                              color: iconsColor,
                            ),
                            Text(
                              SplitName.splitExt(name: ringtonModel.name!),
                              style: customNormalText(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      heroTag: ringtonModel.id,
                      backgroundColor: iconsColor,
                      onPressed: null,
                      child: const Icon(
                        Icons.arrow_right,
                        size: 56,
                        color: menuBackgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
