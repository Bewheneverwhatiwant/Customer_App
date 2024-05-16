import 'package:flutter/material.dart';

class ShopInfoBanner extends StatelessWidget {
  const ShopInfoBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '야미마라탕',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            '별점 5.0',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/icon_call.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 4),
                  const Text('가게 전화'),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icon_chat.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 4),
                  const Text('가게 채팅'),
                ],
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icon_doubleheart.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 4),
                  const Text('가게 찜'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '최소주문금액: 0000원\n'
            '결제방법: 바로결제, 만나서 결제\n'
            '기본 배달비: 0000원',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
