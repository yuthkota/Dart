import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery with Enum Data',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ImageGallery(),
    );
  }
}

// Enum with each image's data
enum GalleryImage {
  image1('assets/w4-s2/bird.jpg', 'Beautiful Flowers 1'),
  image2('assets/w4-s2/bird2.jpg', 'Beautiful Flowers 2'),
  image3('assets/w4-s2/girl.jpg', 'Beautiful Flowers 3');

  // Properties
  final String assetPath;
  final String description;

  // Constructor
  const GalleryImage(this.assetPath, this.description);
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<GalleryImage> _images = GalleryImage.values;

  void _goToNextImage() {
    setState(() {
      _currentPage = (_currentPage + 1) % _images.length; // Circular navigation
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  void _goToPreviousImage() {
    setState(() {
      _currentPage = (_currentPage - 1 + _images.length) % _images.length; // Circular navigation
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Viewer'),
      ),
      body: Column(
        children: [
          // Green container with "Image viewer" text on the left and navigation buttons on the right
          Container(
            color: Colors.green[300],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left-aligned text
                Text(
                  'Image viewer',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                // Right-aligned navigation arrows
                Row(
                  children: [
                    IconButton(
                      onPressed: _goToPreviousImage,
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: _goToNextImage,
                      icon: Icon(Icons.arrow_forward),
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Image display and description
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _images.length,
              itemBuilder: (context, index) {
                final currentImage = _images[index];
                return Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        currentImage.assetPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        currentImage.description,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
