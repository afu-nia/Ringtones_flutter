import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';
import 'package:ringtones_flutter/src/presentation/pages/fav_page/fav_controller.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/bottom_modal.dart';
import 'package:ringtones_flutter/src/presentation/pages/widgets/row_rington.dart';

class FavPage extends StatelessWidget {
  FavPage({Key? key}) : super(key: key);

  final FavController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            itemCount: favController.ringtonsFav.length,
            itemBuilder: (context, index) {
              RingtonModel ringtonModel = favController.ringtonsFav[index];
              return rowRigton(
                ringtonModel: ringtonModel,
                // fav: 'fav',
                function: () {
                  print('fav-$index');
                  bottomModalBar(
                    buildContext: context,
                    ringtonModel: ringtonModel,
                    tag: 'bottom',
                    id: ringtonModel.id.toString(),
                    //homeController: _homeController,
                    // index: index.toString(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
