import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/contants/global_constants.dart';
import 'package:ringtones_flutter/src/domain/models/app_model.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';
import 'package:ringtones_flutter/src/domain/request/request_ringtones.dart';
import 'package:ringtones_flutter/src/domain/response/response_ringtones.dart';

class HomeController extends GetxController {
  HomeController({required this.repositoryInterface});

  late RepositoryInterface repositoryInterface;

  RxBool isLoading = true.obs;
  RxList<RingtonModel> ringtons = <RingtonModel>[].obs;

  @override
  void onInit() async {
    ResponseRingtones resp = await repositoryInterface.getRingtones(
      requestRingtones: RequestRingtones(
        appModel: AppModel(idApp: appId),
      ),
    );
    ringtons(resp.ringtones);
    super.onInit();
  }
}
