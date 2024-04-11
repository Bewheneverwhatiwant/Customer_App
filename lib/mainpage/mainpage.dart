import 'package:flutter/material.dart';
import './menuCategory/jokbo.dart';
import './menuCategory/bunsick.dart';
import './menuCategory/burger.dart';
import './menuCategory/chicken.dart';
import './menuCategory/chinese.dart';
import './menuCategory/dessert.dart';
import './menuCategory/japanese.dart';
import './menuCategory/pizza.dart';
import './menuCategory/zzim.dart';
// 홈화면입니다.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 상수 배열로 메뉴 카테고리 별도 분리
  final List<Map<String, dynamic>> buttons = [
    {'title': '족발/보쌈', 'page': const Jokbo()},
    {'title': '돈까스/회', 'page': const Japanese()},
    {'title': '피자', 'page': const Pizza()},
    {'title': '중식', 'page': const Chinese()},
    {'title': '치킨', 'page': const Chicken()},
    {'title': '버거', 'page': const Burger()},
    {'title': '분식', 'page': const Bunsick()},
    {'title': '디저트', 'page': const Dessert()},
    {'title': '찜/찌개', 'page': const Zzim()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView.count(
        crossAxisCount: 3, // 3열
        mainAxisSpacing: 10, // 수직 간격
        crossAxisSpacing: 10, // 수평 간격
        padding: const EdgeInsets.all(20), // 그리드 패딩
        children: buttons
            .map<Widget>(
                (button) => _buildRoundButton(button['title'], button['page']))
            .toList(),
      ),
    );
  }

  Widget _buildRoundButton(String title, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), // 동그란 버튼 모양
        padding: const EdgeInsets.all(5), // 버튼 내부 패딩
      ),
      child: Text(title),
    );
  }
}
