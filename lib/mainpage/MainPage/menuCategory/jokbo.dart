import 'package:flutter/material.dart';
import 'ShopPage/ShopPage.dart';
import './ShopPage/buildShopButton.dart';
import './ShopPage/ShopBanner.dart';
import '../header.dart';
import '../Navi.dart';
import 'bunsick.dart';
import 'burger.dart';
import 'chicken.dart';
import 'chinese.dart';
import 'japanese.dart';
import 'pizza.dart';
import 'dessert.dart';
import 'zzim.dart';
import './ShopPage/MyCart.dart';

class Jokbo extends StatefulWidget {
  const Jokbo({super.key});

  @override
  State<Jokbo> createState() => _JokboState();
}

class _JokboState extends State<Jokbo> {
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

  // 체크된 메뉴 항목들을 저장하는 리스트
  final List<String> checkedMenus = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: const Color(0xFF161F4E), // #161F4E 색상 설정
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ShopBanner(buttons: buttons), // ShopBanner를 상단에 추가
                const SizedBox(
                    height: 20), // ShopBanner와 buildShopButton 간의 간격 추가
                buildShopButton(
                    context,
                    '매장 1',
                    ShopPage(
                      menus: [
                        '메뉴 1-1',
                        '메뉴 1-2',
                        '메뉴 1-3',
                        '메뉴 1-4',
                        '메뉴 1-5',
                        '메뉴 1-6',
                        '메뉴 1-7',
                        '메뉴 1-8',
                        '메뉴 1-9',
                        '메뉴 1-10',
                      ],
                      checkedMenus: checkedMenus,
                    )),
                const SizedBox(height: 10),
                buildShopButton(
                    context,
                    '매장 2',
                    ShopPage(
                      menus: ['메뉴 2-1', '메뉴 2-2'],
                      checkedMenus: checkedMenus,
                    )),
                const SizedBox(height: 10),
                buildShopButton(
                    context,
                    '매장 3',
                    ShopPage(
                      menus: ['메뉴 3-1', '메뉴 3-2', '메뉴 3-3', '메뉴 3-4'],
                      checkedMenus: checkedMenus,
                    )),
                const SizedBox(height: 10),
                buildShopButton(
                    context,
                    '매장 4',
                    ShopPage(
                      menus: ['메뉴 4-1'],
                      checkedMenus: checkedMenus,
                    )),
                const SizedBox(height: 10),
                buildShopButton(
                    context,
                    '매장 5',
                    ShopPage(
                      menus: ['메뉴 5-1', '메뉴 5-2'],
                      checkedMenus: checkedMenus,
                    )),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: MyCartButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyCartPage(checkedMenus: checkedMenus),
                    ),
                  );
                },
                checkedMenus: checkedMenus,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navi(),
    );
  }
}
