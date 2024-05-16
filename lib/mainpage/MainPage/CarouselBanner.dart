import 'package:flutter/material.dart';
import 'dart:async';

class CarouselBanner extends StatefulWidget {
  @override
  _CarouselBannerState createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  final List<Color> colors = [
    Color(0xFFD9D9D9),
    Color(0xFF7A7A7A),
    Color(0xFF3F3F3F)
  ];
  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % colors.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 350,
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: Container(
                  key: ValueKey<int>(currentIndex),
                  decoration: BoxDecoration(
                    color: colors[currentIndex],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(colors.length, (index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? Color(0xFF70A9FF)
                    : Color(0xFFD9D9D9),
              ),
            );
          }),
        ),
      ],
    );
  }
}
