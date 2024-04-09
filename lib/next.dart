import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  // const NextScreen({Key? key}) : super(key: key);
  // flutter 2.0 이상에서, 위젯 생성자에서 key 같은 매개변수를 부모 위젯으로 전달할 때 코드를 더 간단하게 만들 수 있게 됨
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('다음 화면에 오신 것을 환영합니다!'),
      ),
    );
  }
}
