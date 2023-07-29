import 'package:get/get.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/local_preferences_storage.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';

class FavController extends GetxController {
  late RepositoryInterface repositoryInterface;
  FavController({required this.repositoryInterface});
  RxList<RingtonModel> ringtonsFav = <RingtonModel>[].obs;

  @override
  void onInit() async {
    super.onInit();

    await loadFavs();
  }

  Future<void> loadFavs() async {
    ringtonsFav.clear();
    final items = await LocalPreferencesStorage.storeFavs
        .collection(collectionFavs)
        .get();

    items?.forEach((key, value) {
      ringtonsFav.add(RingtonModel.fromMap(value));
    });
  }
}
