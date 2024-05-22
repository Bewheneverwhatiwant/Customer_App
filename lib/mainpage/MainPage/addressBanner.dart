import 'package:flutter/material.dart';

class AddressBanner extends StatelessWidget {
  final String address;

  const AddressBanner({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF6210CC), // 배경색 설정
      padding: const EdgeInsets.all(16.0), // 내부 여백 설정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  address,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                onPressed: () {
                  // 드롭다운 버튼 클릭 시의 동작 정의
                },
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
              hintText: '가게/메뉴 검색',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 0.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
