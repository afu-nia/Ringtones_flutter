import 'package:ringtones_flutter/src/data/repository/remote/connection_services.dart';
import 'package:ringtones_flutter/src/domain/repository/repository_interf.dart';
import 'package:ringtones_flutter/src/domain/request/request_ringtones.dart';
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
    return ConnectionServices().getRingtones();
  }

  @override
  Future<void> changeTheme() async {
    ThemeServices().switchTheme();
  }
}
