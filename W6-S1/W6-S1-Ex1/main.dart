import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.purple[50],
          child: ListView(
            children: [
              // Method 1: Using a direct for-loop
              const Label("Method 1: Loop in Array", bold: true),
              const Text("Start"),
              for (var color in colors) Text(color),
              const Text("End"),

              // Method 2: Using the map() method
              const Label("Method 2: Map", bold: true),
              const Text("Start"),
              ...colors.map((color) => Text(color)),
              const Text("End"),

              // Method 3: Using a dedicated function
              const Label("Method 3: Dedicated Function", bold: true),
              const Text("Start"),
              ...getLabels(),
              const Text("End"),
            ],
          ),
        ),
      ),
    ),
  ));
}

// Method 3: Using a dedicated function
List<Widget> getLabels() {
  return colors.map((color) => Text(color)).toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        text,
        style:
            TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }
}
