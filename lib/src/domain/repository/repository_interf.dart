import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/request/request_ringtones.dart';
import 'package:ringtones_flutter/src/domain/request/search_ringtones.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';

abstract class RepositoryInterface {
  Future<bool?> firstOpen();
  Future<ResponseRingtones> getRingtones(
      {required RequestRingtones requestRingtones});
  Future<void> changeTheme();

  Future<ResponseRingtones> searchRingtones(
      {required SearchRingtonesRequest searchRingtonesRequest});

  Future<void> addFavorite(
      {required RingtonModel ringtonFav, required String id});
  Stream<Map<String, dynamic>> listFavRingtons();
  Future<void> deleteFav({required String id});
  Future<bool> isFav({required String id});
}
