import 'package:flutter/material.dart';
import '../ShopPage/ShopPage.dart';
import '../ShopPage//buildShopButton.dart';

class Chicken extends StatefulWidget {
  const Chicken({super.key});

  @override
  State<Chicken> createState() => _ChickenState();
}

class _ChickenState extends State<Chicken> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildShopButton(context, '매장 1',
                const ShopPage(menus: ['메뉴 1-1', '메뉴 1-2', '메뉴 1-3'])),
            const SizedBox(height: 10),
            buildShopButton(
                context, '매장 2', const ShopPage(menus: ['메뉴 2-1', '메뉴 2-2'])),
            const SizedBox(height: 10),
            buildShopButton(
                context,
                '매장 3',
                const ShopPage(
                    menus: ['메뉴 3-1', '메뉴 3-2', '메뉴 3-3', '메뉴 3-4'])),
            const SizedBox(height: 10),
            buildShopButton(context, '매장 4', const ShopPage(menus: ['메뉴 4-1'])),
            const SizedBox(height: 10),
            buildShopButton(
                context, '매장 5', const ShopPage(menus: ['메뉴 5-1', '메뉴 5-2'])),
          ],
        ),
      ),
    );
  }
}
