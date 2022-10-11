import 'dart:convert';

import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/request/search_ringtones.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';

class SearchRingtones extends GetConnect {
  Future<ResponseRingtones> searchRingtones(
      {required SearchRingtonesRequest searchRingtonesRequest}) async {
    List<RingtonModel> ringtones = [];
    Response response = await get(
      '$searchRingtonesUrl/${searchRingtonesRequest.word}',
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
