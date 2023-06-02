import 'package:flutter/material.dart';
import 'package:random_velvet/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        body: const RvPage(),
      ),
    );
  }
}

class RvPage extends StatefulWidget {
  const RvPage({super.key});
  @override
  State<RvPage> createState() => _RvPageState();
}

class _RvPageState extends State<RvPage> {
  var currentPair = RedVelvet.generateRandomPair();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const SizedBox(height: 64),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: AspectRatio(
                aspectRatio: 1 / 1.5,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      currentPair = RedVelvet.changeFirstMember(currentPair);
                    });
                  },
                  child: PhotoCard(member: currentPair[0]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
              child: AspectRatio(
                aspectRatio: 1 / 1.5,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      currentPair = RedVelvet.changeSecondMember(currentPair);
                    });
                  },
                  child: PhotoCard(member: currentPair[1]),
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
  final Member member;
  const PhotoCard({
    required this.member,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20.0)),
              child: Image.asset(
                'images/${member.imageString}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                RedVelvet.launchInstagramURL(member);
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Icon(
                    FontAwesomeIcons.instagram,
                    color: member.color,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    member.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
