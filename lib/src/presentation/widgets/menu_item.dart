import 'package:flutter/material.dart';
import 'package:ringtones_flutter/src/presentation/theme/text_style.dart';

Widget menuItem({
  required Function() function,
  required IconData icon,
  required String title,
  required Color iconColor,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: function,
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ), // sunny
          Text(
            title,
            style: customNormalText(fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
