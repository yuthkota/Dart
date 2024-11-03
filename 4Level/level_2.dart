class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);

  Point Pointtranslate(double dx, double dy) {
    return Point(x + dx, y + dy);
  }

   @override
  String toString() {
    return 'Point (x: $x, y: $y)';
  }
}

void main() {
  const Point p = Point(1, 2);
  print('Point(x:${p.x},y:${p.y})');
  var newpoint = p.Pointtranslate(3, 4);
  print("Newpoint:$newpoint");
  print("FirstPoint:$p");
}
