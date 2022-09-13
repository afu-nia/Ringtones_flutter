import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)!.open();
            },
            child: Icon(Icons.menu)),
      ),
      body: const Center(
        child: Text('HOME PAGE'),
      ),
    );
  }
}
