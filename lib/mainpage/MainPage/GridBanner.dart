import 'package:flutter/material.dart';

class GridBanner extends StatelessWidget {
  final List<Map<String, dynamic>> buttons;

  const GridBanner({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF95B3FF), // #95B3FF 색상 값 사용
      child: GridView.count(
        crossAxisCount: 3, // 3열
        mainAxisSpacing: 10, // 수직 간격
        crossAxisSpacing: 10, // 수평 간격
        padding: const EdgeInsets.all(20), // 그리드 패딩
        children: buttons
            .map<Widget>((button) => _buildRoundButton(
                context, button['title'], button['page'], button['img']))
            .toList(),
      ),
    );
  }

  Widget _buildRoundButton(
      BuildContext context, String title, Widget page, String img) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), // 동그란 버튼 모양
        padding: const EdgeInsets.all(5), // 버튼 내부 패딩
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/$img',
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
