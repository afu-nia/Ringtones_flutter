import 'package:get/get.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/audio_services.dart';
import 'package:ringtones_flutter/src/data/repository/local/services/local_preferences_storage.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';
import 'package:ringtones_flutter/src/domain/request/request_ringtones.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';

class HomeController extends GetxController {
  HomeController({required this.repositoryInterface});

  late RepositoryInterface repositoryInterface;

  RxBool isLoading = true.obs;
  RxList<RingtonModel> ringtons = <RingtonModel>[].obs;
  RxBool isPlaying = false.obs;
  RxBool isFinish = false.obs;

  @override
  void onInit() async {
    ResponseRingtones resp = await repositoryInterface.getRingtones(
      requestRingtones: RequestRingtones(),
    );
    ringtons(resp.ringtones);
    isLoading(false);
    super.onInit();
  }

  void playController() async {
    if (isPlaying()) {
      pause();
      isPlaying(false);
    } else {
      play(homeController: this);
      isPlaying(true);
    }
  }

  void addFavController({
    String id = '0',
    RingtonModel? ringtonModel,
  }) async {
    int i = int.parse(id);
    if (i == 0) {
      final id =
          LocalPreferencesStorage.storeFavs.collection(collectionFavs).doc().id;
      print('add favorite-->: $id');
      await repositoryInterface.addFavorite(ringtonFav: ringtonModel!, id: id);
    } else {
      bool? isFav = await repositoryInterface.isFav(id: id);

      if (isFav) {
        print('delete favorite-->:');
        // repositoryInterface.deleteFav(id: id);
      }
    }
  }
}
