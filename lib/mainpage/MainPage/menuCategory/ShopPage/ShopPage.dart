import 'package:flutter/material.dart';
import './../../Navi.dart';
import './../../header.dart';
import './ShopInfoBanner.dart';
import './ShopDetailBanner.dart';
import './buildMenuButton.dart';
import './MyCart.dart';

// buildShopButton 클릭 시 이동하는 페이지

class ShopPage extends StatefulWidget {
  final List<String> menus;
  final List<String> checkedMenus;

  const ShopPage({Key? key, required this.menus, required this.checkedMenus})
      : super(key: key);

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

  void handleMenuChanged(Map<String, bool> updatedMenuChecked) {
    setState(() {
      menuChecked = updatedMenuChecked;
      widget.checkedMenus.clear();
      widget.checkedMenus.addAll(menuChecked.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_hufsGalImg_ex.png',
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const ShopInfoBanner(),
                ShopDetailBanner(),
                ...widget.menus.map((menu) {
                  return buildMenuButton(
                    context,
                    menu,
                    menuChecked[menu]!,
                    (bool? value) {
                      setState(() {
                        menuChecked[menu] = value!;
                        widget.checkedMenus.clear();
                        widget.checkedMenus.addAll(menuChecked.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key));
                      });
                    },
                  );
                }).toList(),
                const SizedBox(height: 100), // Ensure space for floating button
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
                  // Navigate to cart page with selected items
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyCartPage(checkedMenus: widget.checkedMenus),
                    ),
                  );
                },
                checkedMenus: widget.checkedMenus, // Add this line
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navi(),
    );
  }
}
