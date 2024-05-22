import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: const Color(0xFF6210CC), // #161F4E 색상 값 사용
    title: const Text(''),
    actions: [
      IconButton(
        icon: Image.asset('assets/icon_home.png',
            width: 24, height: 24, color: Colors.white),
        onPressed: () {
          // 홈 아이콘 눌렀을 때의 동작 정의
        },
      ),
      IconButton(
        icon: Image.asset('assets/icon_cart.png',
            width: 24, height: 24, color: Colors.white),
        onPressed: () {
          // 카트 아이콘 눌렀을 때의 동작 정의
        },
      ),
    ],
  );
}
