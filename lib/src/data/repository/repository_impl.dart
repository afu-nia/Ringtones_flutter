import 'package:ringtones_flutter/src/data/repository/local/services/local_preferences_storage.dart';
import 'package:ringtones_flutter/src/data/repository/remote/get_ringtones.dart';
import 'package:ringtones_flutter/src/data/repository/remote/search_ringtones.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';
import 'package:ringtones_flutter/src/domain/request/request_ringtones.dart';
import 'package:ringtones_flutter/src/domain/request/search_ringtones.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';
import 'package:ringtones_flutter/src/presentation/theme/theme_services.dart';

class RepositoryImplementation implements RepositoryInterface {
  @override
  Future<bool?> firstOpen() async {
    // TODO: implement firstOpen
    throw UnimplementedError();
  }

  @override
  Future<ResponseRingtones> getRingtones(
      {required RequestRingtones requestRingtones}) async {
    return GetRingtones().getRingtones();
  }

  @override
  Future<void> changeTheme() async {
    ThemeServices().switchTheme();
  }

  @override
  Future<ResponseRingtones> searchRingtones(
      {required SearchRingtonesRequest searchRingtonesRequest}) async {
    return SearchRingtones().searchRingtones(
      searchRingtonesRequest: searchRingtonesRequest,
    );
  }

  @override
  Future<void> addFavorite(
      {required RingtonModel ringtonFav, required String id}) async {
    await LocalPreferencesStorage.storeFavs
        .collection(collectionFavs)
        .doc(id)
        .set(
      {
        'id': ringtonFav.id,
        'app_id': ringtonFav.appId,
        'name': ringtonFav.name,
        'path_rington': ringtonFav.pathRington,
        'image': ringtonFav.image,
        'created_at': ringtonFav.createdAt,
        'updated_at': ringtonFav.updatedAt,
      },
    );
  }

  @override
  Stream<Map<String, dynamic>> listFavRingtons() {
    return LocalPreferencesStorage.storeFavs.collection(collectionFavs).stream;
  }

  @override
  Future<void> deleteFav({required String id}) async {
    LocalPreferencesStorage.storeFavs
        .collection(collectionFavs)
        .doc(id)
        .delete();
  }

  @override
  Future<bool> isFav({required String id}) async {
    final data = await LocalPreferencesStorage.storeFavs
        .collection(collectionFavs)
        .doc(id)
        .get();
    return data?.isNotEmpty ?? false;
  }
}
