import 'package:flutter/material.dart';
import '../ShopPage/ShopPage.dart';
import '../ShopPage/buildShopButton.dart';

// 매장 이름과 매장별 메뉴 정보를 상수 배열로 분리
// TODO: shop.txt 파일에서 category에 따라 받아오도록 개선 필요 (현재 알 수 없는 JSON 형식 오류로 출력 불가)

const List<Map<String, dynamic>> shops = [
  {
    "name": "매장 1",
    "menus": ["메뉴 1-1", "메뉴 1-2"],
    "category": "bunsick"
  },
  {
    "name": "매장 2",
    "menus": ["메뉴 2-1", "메뉴 2-2"],
    "category": "bunsick"
  },
  {
    "name": "매장 3",
    "menus": ["메뉴 3-1", "메뉴 3-2"],
    "category": "bunsick"
  },
  {
    "name": "매장 4",
    "menus": ["메뉴 4-1", "메뉴 4-2"],
    "category": "burger"
  },
  {
    "name": "매장 5",
    "menus": ["메뉴 5-1", "메뉴 5-2"],
    "category": "burger"
  },
  {
    "name": "매장 6",
    "menus": ["메뉴 6-1", "메뉴 6-2"],
    "category": "burger"
  },
  {
    "name": "매장 7",
    "menus": ["메뉴 7-1", "메뉴 7-2"],
    "category": "chicken"
  },
  {
    "name": "매장 8",
    "menus": ["메뉴 8-1", "메뉴 8-2"],
    "category": "chicken"
  },
  {
    "name": "매장 9",
    "menus": ["메뉴 9-1", "메뉴 9-2"],
    "category": "chicken"
  },
  {
    "name": "매장 10",
    "menus": ["메뉴 10-1", "메뉴 10-2"],
    "category": "chinese"
  },
  {
    "name": "매장 11",
    "menus": ["메뉴 11-1", "메뉴 11-2"],
    "category": "chinese"
  },
  {
    "name": "매장 12",
    "menus": ["메뉴 12-1", "메뉴 12-2"],
    "category": "chinese"
  },
  {
    "name": "매장 13",
    "menus": ["메뉴 13-1", "메뉴 13-2"],
    "category": "dessert"
  },
  {
    "name": "매장 14",
    "menus": ["메뉴 14-1", "메뉴 14-2"],
    "category": "dessert"
  },
  {
    "name": "매장 15",
    "menus": ["메뉴 15-1", "메뉴 15-2"],
    "category": "dessert"
  },
  {
    "name": "매장 16",
    "menus": ["메뉴 16-1", "메뉴 16-2"],
    "category": "japanese"
  },
  {
    "name": "매장 17",
    "menus": ["메뉴 17-1", "메뉴 17-2"],
    "category": "japanese"
  },
  {
    "name": "매장 18",
    "menus": ["메뉴 18-1", "메뉴 18-2"],
    "category": "japanese"
  },
  {
    "name": "매장 19",
    "menus": ["메뉴 19-1", "메뉴 19-2"],
    "category": "jokbo"
  },
  {
    "name": "매장 20",
    "menus": ["메뉴 20-1", "메뉴 20-2"],
    "category": "jokbo"
  },
  {
    "name": "매장 21",
    "menus": ["메뉴 21-1", "메뉴 21-2"],
    "category": "jokbo"
  },
  {
    "name": "매장 22",
    "menus": ["메뉴 22-1", "메뉴 22-2"],
    "category": "pizza"
  },
  {
    "name": "매장 23",
    "menus": ["메뉴 23-1", "메뉴 23-2"],
    "category": "pizza"
  },
  {
    "name": "매장 24",
    "menus": ["메뉴 24-1", "메뉴 24-2"],
    "category": "pizza"
  },
  {
    "name": "매장 25",
    "menus": ["메뉴 25-1", "메뉴 25-2"],
    "category": "zzim"
  },
  {
    "name": "매장 26",
    "menus": ["메뉴 26-1", "메뉴 26-2"],
    "category": "zzim"
  },
  {
    "name": "매장 27",
    "menus": ["메뉴 27-1", "메뉴 27-2"],
    "category": "zzim"
  }
];

class Bunsick extends StatefulWidget {
  const Bunsick({super.key});

  @override
  State<Bunsick> createState() => _BunsickState();
}

class _BunsickState extends State<Bunsick> {
  @override
  Widget build(BuildContext context) {
    // 'bunsick' 카테고리를 가진 매장만 필터링
    final bunsickShops =
        shops.where((shop) => shop['category'] == 'bunsick').toList();

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: bunsickShops.length, // 필터링된 매장의 수만큼 아이템 생성
        itemBuilder: (context, index) {
          final shop = bunsickShops[index]; // 현재 인덱스의 매장 정보
          return Column(
            children: [
              buildShopButton(context, shop['name'],
                  ShopPage(menus: shop['menus'] as List<String>)),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
