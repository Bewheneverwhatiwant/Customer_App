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
        children: <Widget>[
          _buildRoundButton('족발/보쌈', Jokbo()),
          _buildRoundButton('돈까스/회', Japanese()),
          _buildRoundButton('피자', Pizza()),
          _buildRoundButton('중식', Chinese()),
          _buildRoundButton('치킨', Chicken()),
          _buildRoundButton('버거', Burger()),
          _buildRoundButton('분식', Bunsick()),
          _buildRoundButton('디저트', Dessert()),
          _buildRoundButton('찜/찌개', Zzim()),
        ],
      ),
    );
  }

// _buildRundButton 메소드 분리
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
