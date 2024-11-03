import 'package:flutter/material.dart';


class HobbyCard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.iconData,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                iconData,
                size: 40,
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold ),
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
void main() {
  runApp(MaterialApp(
    title: 'Hobby Cards',
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbyCard(
              title: 'Travelling',
              iconData: Icons.travel_explore,
              backgroundColor: Colors.green,
            ),
            HobbyCard(
              title: 'Coding',
              iconData: Icons.code,
              backgroundColor: Colors.blue,
            ),
            HobbyCard(
              title: 'Reading',
              iconData: Icons.book,
              backgroundColor: Colors.purple,
            ),
          ],
        ),
      ),
    ),
  ));
}

