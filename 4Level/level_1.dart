class Point {
  double x;
  double y;

  Point(this.x, this.y);

  void Pointtranslate(double dx, double dy) {
    x += dx;
    y += dy;
  }
}

void main() {
  
  Point p = Point(1, 2); 
  print('Point(x:${p.x},y:${p.y})');  
  p.Pointtranslate(3, 4);
  print('Point(x:${p.x},y:${p.y})');  

 
}
