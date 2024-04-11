import 'package:flutter/material.dart';

Widget buildShopButton(BuildContext context, String title, Widget page) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(20),
    ),
    child: Text(title),
  );
}
