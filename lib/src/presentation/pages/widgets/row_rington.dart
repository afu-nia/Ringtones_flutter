import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/utils/split_name.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';

Widget rowRigton({
  required RingtonModel ringtonModel,
  required Function() function,
}) {
  return GestureDetector(
    onTap: function,
    child: Padding(
      padding: const EdgeInsets.all(6.0),
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
              ), //.circular(48),
              child: Hero(
                tag: 'bottom-${ringtonModel.name!}',
                child: Image.network(
                  'https://www.pintomicasa.com/img/2016/10/Rosa-azul-728x544.jpg',
                  //ringtonModel.image!,
                  width: Get.size.width * 0.18,
                  height: Get.size.height * 0.1,
                  fit: BoxFit.cover,
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
              Text(
                SplitName.splitName(name: ringtonModel.name!),
                style: boldText(fontSize: 18),
              ),
              SizedBox(
                height: Get.size.height * 0.01,
              ),
              Text(
                SplitName.splitName(name: ringtonModel.name!),
                style: normalText(),
              ),
            ],
          ),
        ],
      ),
    ),
  ); //,
  //);
}
