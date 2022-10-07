import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/audio_services.dart';
import 'package:ringtones_flutter/src/domain/contants/colors.dart';
import 'package:ringtones_flutter/src/domain/models/position_data.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

Widget sleekCircular({
  required String tag,
  required String name,
  required String image,
}) {
  return StreamBuilder<PositionData>(
    stream: positionDataStream,
    builder: (context, snapshot) {
      final positionData = snapshot.data;

      return positionData == null
          ? const Center(child: CircularProgressIndicator())
          : SleekCircularSlider(
              max: positionData.duration.inSeconds.toDouble(),
              min: 0,
              initialValue: positionData.position.inSeconds.toDouble(),
              onChange: (value) {
                seek(Duration(seconds: value.toInt()));
              },
              appearance: CircularSliderAppearance(
                size: Get.size.width * 0.6,
                spinnerMode: false,
                customColors: CustomSliderColors(
                    dynamicGradient: true,
                    trackColor: iconsColor,
                    //progressBarColor: menuBackgroundColor.withOpacity(0.8),
                    dotColor: Colors.pink),
                customWidths: CustomSliderWidths(
                  progressBarWidth: 18,
                  handlerSize: 10,
                  shadowWidth: 10,
                  trackWidth: 10,
                ),
              ),
              innerWidget: (percentage) {
                return Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(96),
                    child: Hero(
                      //tag: name,
                      tag: '$tag-$name',
                      child: Image.network(
                        image,
                        //'${ringtonModel.image}',
                        height: Get.size.height * 0.3,
                        width: Get.size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            );
    },
  );
}
