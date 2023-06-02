// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:random_velvet/data.dart';

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
        backgroundColor: Colors.grey[900],
        body: RvPage(),
      ),
    );
  }
}

class RvPage extends StatelessWidget {
  var currentPair = RedVelvet.generateRandomPair();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          SizedBox(height: 64),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: AspectRatio(
                aspectRatio: 1,
                child: TextButton(
                  onPressed: () {},
                  child: PhotoCard(imagePath: currentPair[0].imageString),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: AspectRatio(
                aspectRatio: 1,
                child: TextButton(
                  onPressed: () {},
                  child: PhotoCard(imagePath: currentPair[1].imageString),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final String imagePath;
  const PhotoCard({
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: -8,
            blurRadius: 30,
            color: Color.fromRGBO(0, 0, 0, 1),
          )
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'images/$imagePath',
          ),
        ),
      ),
    );
  }
}
