import 'package:flutter/material.dart';

Widget buildMenuButton(BuildContext context, String menu, bool isChecked,
    ValueChanged<bool?> onChanged) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(width: 10),
      Checkbox(
        value: isChecked,
        onChanged: onChanged,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        activeColor: const Color(0xFF95B3FF),
      ),
      Text(menu),
      SizedBox(width: 10),
    ],
  );
}
