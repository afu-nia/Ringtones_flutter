import 'dart:convert';

import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';

class ConnectionServices extends GetConnect {
  Future<ResponseRingtones> getRingtones() async {
    List<RingtonModel> ringtones = [];
    Response response = await get(
      homeUrl + appId,
      headers: {
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.bodyString.toString());
      var rings = data['ringtones'];
      ringtones = rings
          .map<RingtonModel>((ring) => RingtonModel.fromJson(ring))
          .toList();
      return ResponseRingtones(ringtones: ringtones);
    } else {
      return ResponseRingtones(ringtones: []);
    }
  }
}
