import 'package:flutter/material.dart';

Widget buildShopButton(BuildContext context, String title, Widget page) {
  return Container(
    width: 300,
    height: 80,
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.grey[300], // 버튼 배경색 설정
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Image.asset(
            'assets/icon_ShopImg_ex.png',
            width: 40,
            height: 40,
          ),
        ],
      ),
    ),
  );
}
