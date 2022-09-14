import 'package:ringtones_flutter/src/domain/request/request_ringtones.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';

abstract class RepositoryInterface {
  Future<bool?> firstOpen();
  Future<ResponseRingtones> getRingtones(
      {required RequestRingtones requestRingtones});
  Future<void> changeTheme();
}
