import 'package:flutter/material.dart';

// 카테고리 진입 후 상단에 가로로 스크롤 가능한 가게 목록 버튼들

class ShopBanner extends StatelessWidget {
  final List<Map<String, dynamic>> buttons;

  const ShopBanner({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF95B3FF), // 배경색 설정
      padding: const EdgeInsets.all(10), // 패딩 설정
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: buttons.map<Widget>((button) {
            return _buildRoundButton(
                context, button['title'], button['page'], button['img']);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildRoundButton(
      BuildContext context, String title, Widget page, String img) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), // 동그란 버튼 모양
              padding: const EdgeInsets.all(20), // 버튼 내부 패딩
              backgroundColor: Colors.grey[300], // 버튼 배경색
            ),
            child: Image.asset(
              'assets/$img',
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(height: 5),
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
