import 'package:flutter/material.dart';
import 'menuCategory/jokbo.dart';
import 'menuCategory/bunsick.dart';
import 'menuCategory/burger.dart';
import 'menuCategory/chicken.dart';
import 'menuCategory/chinese.dart';
import 'menuCategory/dessert.dart';
import 'menuCategory/japanese.dart';
import 'menuCategory/pizza.dart';
import 'menuCategory/zzim.dart';
import './header.dart';
import './addressBanner.dart';
import './GridBanner.dart';
import './CarouselBanner.dart';
import './Navi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> buttons = [
    {'title': '족발/보쌈', 'page': const Jokbo(), 'img': 'icon_bossam.png'},
    {'title': '돈까스/회', 'page': const Japanese(), 'img': 'icon_sushi.png'},
    {'title': '피자', 'page': const Pizza(), 'img': 'icon_pizza.png'},
    {'title': '중식', 'page': const Chinese(), 'img': 'icon_zzazang.png'},
    {'title': '치킨', 'page': const Chicken(), 'img': 'icon_chicken.png'},
    {'title': '버거', 'page': const Burger(), 'img': 'icon_burger.png'},
    {'title': '분식', 'page': const Bunsick(), 'img': 'icon_bunsick.png'},
    {'title': '디저트', 'page': const Dessert(), 'img': 'icon_dessert.png'},
    {'title': '찜/찌개', 'page': const Zzim(), 'img': 'icon_zzigae.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xFF161F4E), // #161F4E 색상 설정
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBanner(address: '경기도 용인시 처인구 모현읍 백옥대로 2384번길 11'),
            SizedBox(height: 20),
            Container(
              height: 400, // GridView의 높이를 고정값으로 설정하여 스크롤이 가능하도록 함
              child: GridBanner(buttons: buttons),
            ),
            SizedBox(height: 20),
            CarouselBanner(),
            SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: const Navi(),
    );
  }
}
