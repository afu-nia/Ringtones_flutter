import 'package:get/get.dart';
import 'package:ringtones_flutter/src/data/repository/repository_impl.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepositoryInterface>(
      () => RepositoryImplementation(),
      fenix: true,
    );
  }
}
