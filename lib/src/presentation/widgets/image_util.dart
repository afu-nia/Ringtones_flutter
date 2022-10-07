import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget imageUtil({
  required String image,
  required double scaleH,
  required double scaleW,
}) {
  return FadeInImage.assetNetwork(
    placeholder: 'assets/img/loading.png',
    image: image,
    width: Get.size.width * scaleW,
    height: Get.size.height * scaleH,
    fit: BoxFit.cover,
  );
}
