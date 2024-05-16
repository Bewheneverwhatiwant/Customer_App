import 'package:flutter/material.dart';

class ShopDetailBanner extends StatefulWidget {
  const ShopDetailBanner({Key? key}) : super(key: key);

  @override
  _ShopDetailBannerState createState() => _ShopDetailBannerState();
}

class _ShopDetailBannerState extends State<ShopDetailBanner>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFF161F4E), // 배경색 설정
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'Menu'),
              Tab(text: '정보/원산지'),
              Tab(text: '리뷰'),
            ],
          ),
        ),
        Container(
          height: 30,
          child: TabBarView(
            controller: _tabController,
            children: const [
              // 나중에 Center 내부에 CheckBox들(=buildMenuButton) 위치시키는걸로 바꾸기
              // Center(child: Text('Menu content')),
              // Center(child: Text('정보/원산지 content')),
              // Center(child: Text('리뷰 content')),
              Center(child: Text('')),
              Center(child: Text('')),
              Center(child: Text('')),
            ],
          ),
        ),
      ],
    );
  }
}
