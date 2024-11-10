import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite Cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(), // Use the custom FavoriteCard widget
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorited = false; // Track the favorite state

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text('Description')
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isFavorited = !isFavorited; // Toggle favorite state
              });
            },
            icon: Icon(
              Icons.favorite,
              color: isFavorited ? Colors.red : Colors.grey, // Update color
            ),
          ),
        ],
      ),
    );
  }
}
