import 'package:flutter/material.dart';
import 'next.dart'; // 'next.dart' 파일을 import

// 실행 시 가장 먼저 보일 화면
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  //final String title; 헤더(app bar)에 글을 넣지 않을 것이므로 생략

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

// 버튼 클릭 시 숫자가 증가하는 함수
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

// Scaffold가 return되는 부분이다
// 여기서 Scaffold는 AppBar, body, floatingActionButton으로 구성되어있다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),

            // next 화면으로 이동하는 버튼 추가
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const NextScreen()), // NextScreen으로 이동
                );
              },
              child: const Text('다음 화면으로 이동'),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
