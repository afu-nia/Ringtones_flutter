import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringtones_flutter/src/domain/models/rington_model.dart';

class SinglePage extends StatelessWidget {
  var args1;
  SinglePage({Key? key, this.args1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(args1);
    return Scaffold(
      body: Hero(
        tag: args1[1],
        child: Image.network(
            'https://www.pintomicasa.com/img/2016/10/Rosa-azul-728x544.jpg'),
      ),
    );
  }
}
