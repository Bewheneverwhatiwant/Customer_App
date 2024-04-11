import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  final List<String> menus;

  const ShopPage({Key? key, required this.menus}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.menus.map((menu) => Text(menu)).toList(),
        ),
      ),
    );
  }
}
