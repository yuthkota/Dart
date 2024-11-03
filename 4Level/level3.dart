class Point {
  final int _x;
  final int _y;

  Point(this._x, this._y);

  Point Pointtranslate(int dx, int dy) {
    return Point(_x + dx, _y + dy);
  }

  int get x => _x;
  int get y => _y;

  @override
  String toString() {
    return "Point( x: $_x, y: $_y)";
  }
}

class Shape {
  final Point _leftP;
  final Point _rightP;
  final int _width;
  final int _height;
  final String? _Color;

  Shape(this._leftP, this._rightP, this._Color)
      : _width = (_rightP.x - _leftP.x).abs(),
        _height = (_rightP.y - _leftP.y).abs();

  Point get leftPoint => _leftP;
  Point get rightPoint => _rightP;
  int get width => _width;
  int get height => _height;
  String? get bgColor => _Color;

  @override
  String toString() {
    return "Shape: Left($_leftP), Right($_rightP), bgColor: $_Color, width: $_width, height: $_height";
  }
}

void main() {
  Point point = Point(13, 8);
  print(point);

  Point point1 = point.Pointtranslate(2, 6);
  print(point1);

  Point point2 = point.Pointtranslate(34, 24);
  print(point2);

  Shape shape = Shape(point1, point2, 'red');
  print(shape);
}
