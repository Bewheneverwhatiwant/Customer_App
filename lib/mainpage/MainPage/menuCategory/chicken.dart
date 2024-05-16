import 'package:flutter/material.dart';
import 'ShopPage/ShopPage.dart';
import './ShopPage/buildShopButton.dart';

class Chicken extends StatefulWidget {
  const Chicken({super.key});

  @override
  State<Chicken> createState() => _ChickenState();
}

class _ChickenState extends State<Chicken> {
  final List<String> checkedMenus = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildShopButton(
              context,
              '매장 1',
              ShopPage(
                menus: ['메뉴 1-1', '메뉴 1-2', '메뉴 1-3'],
                checkedMenus: checkedMenus,
              ),
            ),
            const SizedBox(height: 10),
            buildShopButton(
              context,
              '매장 2',
              ShopPage(
                menus: ['메뉴 2-1', '메뉴 2-2'],
                checkedMenus: checkedMenus,
              ),
            ),
            const SizedBox(height: 10),
            buildShopButton(
              context,
              '매장 3',
              ShopPage(
                menus: ['메뉴 3-1', '메뉴 3-2', '메뉴 3-3', '메뉴 3-4'],
                checkedMenus: checkedMenus,
              ),
            ),
            const SizedBox(height: 10),
            buildShopButton(
              context,
              '매장 4',
              ShopPage(
                menus: ['메뉴 4-1'],
                checkedMenus: checkedMenus,
              ),
            ),
            const SizedBox(height: 10),
            buildShopButton(
              context,
              '매장 5',
              ShopPage(
                menus: ['메뉴 5-1', '메뉴 5-2'],
                checkedMenus: checkedMenus,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
