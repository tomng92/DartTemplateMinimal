import 'package:unittest/unittest.dart';

class Point {
  static final Point ORIGIN = const Point(0, 0);
  static final Point ORIGIN2 = const Point(0, 0);
  final int x;
  final int y;
  const Point(this.x, this.y);
  Point.clone(Point other): x = other.x, y = other.y; //[2]
}

main() {
  test("lasse", () {
  // Assign compile-time constant to p0.
  Point p0 = Point.ORIGIN;
  // Create new point using const constructor.
  Point p1 = new Point(0, 0);
  // Create new point using non-const constructor.
  Point p2 = new Point.clone(p0);
  // Assign (the same) compile-time constant to p3.
  Point p3 = const Point(0, 0);
  print(identical(p0, p1)); // false
  print(identical(p0, p2)); // false
  print(identical(p0, p3)); // true!
  print(identical(Point.ORIGIN, Point.ORIGIN2)); // ??
  });
}
