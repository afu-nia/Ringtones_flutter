import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Row(
          children: [
            Icon(Icons.add),
            Text('Agregar'),
          ],
        ),
      ),
    );
  }
}
