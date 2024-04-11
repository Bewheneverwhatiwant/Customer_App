import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  final List<String> menus;

  const ShopPage({Key? key, required this.menus}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // 메뉴 항목들의 체크 상태를 저장하는 Map 생성
  Map<String, bool> menuChecked = {};

  @override
  void initState() {
    super.initState();
    // 모든 메뉴 항목을 false로 초기화 (체크되지 않은 상태)
    for (var menu in widget.menus) {
      menuChecked[menu] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.menus.map((menu) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: menuChecked[menu],
                  onChanged: (bool? value) {
                    setState(() {
                      menuChecked[menu] = value!;
                    });
                  },
                ),
                Text(menu),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
