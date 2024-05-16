import 'package:flutter/material.dart';

class Navi extends StatelessWidget {
  const Navi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF161F4E), // 네비게이션 바 배경색
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icon_Like.png')),
          label: '찜한 가게',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icon_Bill.png')),
          label: '주문 내역',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/icon_Smile.png')),
          label: '마이페이지',
        ),
      ],
    );
  }
}
