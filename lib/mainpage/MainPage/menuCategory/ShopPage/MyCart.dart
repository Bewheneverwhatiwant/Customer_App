import 'package:flutter/material.dart';
import './../../header.dart';
import './../../Navi.dart';
import './BuyPage.dart';

class MyCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  final List<String> checkedMenus;

  const MyCartButton(
      {Key? key, required this.onPressed, required this.checkedMenus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF95B3FF), // 배경색 설정
        padding: EdgeInsets.zero,
        fixedSize: const Size(180, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text('장바구니에 메뉴 추가', style: TextStyle(color: Colors.black)),
    );
  }
}

class MyCartPage extends StatefulWidget {
  final List<String> checkedMenus;

  const MyCartPage({Key? key, required this.checkedMenus}) : super(key: key);

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  int _quantity = 1;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icon_ShopImg_ex.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '야미마라탕',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '[주문 메뉴]',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            ...widget.checkedMenus.map((menu) {
                              return Text(
                                menu,
                                style: const TextStyle(fontSize: 14),
                              );
                            }).toList(),
                            const SizedBox(height: 8),
                            const Text(
                              '가격: 17000원',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: _decrementQuantity,
                                ),
                                Text('$_quantity개'),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: _incrementQuantity,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          // 아이템 제거 로직
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // 이전 화면으로 이동
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    '+ 더 담으러 가기',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 80), // Ensure space for floating button
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // 결제 페이지로 이동하는 로직 추가
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BuyPage(checkedMenus: widget.checkedMenus),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: const Color(0xFF95B3FF), // 배경색 설정
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: const Size(180, 50),
                ),
                child: const Text(
                  '결제하기',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navi(),
    );
  }
}
