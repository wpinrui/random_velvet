import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Random Velvet'),
          backgroundColor: Colors.red[900],
        ),
        backgroundColor: Colors.redAccent,
        body: RvPage(),
      ),
    );
  }
}

class RvPage extends StatelessWidget {
  const RvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
