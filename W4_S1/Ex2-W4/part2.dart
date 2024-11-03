import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'Master the fundamentals of Dart programming.',
    imageUrl: 'assets/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'Create beautiful and performant cross-platform apps.',
    imageUrl: 'assets/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'Build scalable and real-time applications with Firebase.',
    imageUrl: 'assets/firebase.png',
  );

  final String title;
  final String description;
  final String imageUrl;

  const Product({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 500),
            Text(product.title,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8.0),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Product Cards'),
      ),
      backgroundColor: Colors.blue[800],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
    ),
  ));
}
