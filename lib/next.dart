import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: const Text('새 화면'),
          ),
      body: const Center(
        child: Text('다음 화면에 오신 것을 환영합니다!'),
      ),
    );
  }
}
