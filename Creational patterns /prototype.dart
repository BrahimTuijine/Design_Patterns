abstract interface class Shape {
  Shape clone();
}

class Circle implements Shape {
  late int raduis;

  Circle({required this.raduis});

  Circle.fromSrouce(Circle circle) {
    raduis = circle.raduis;
  }

  @override
  Circle clone() => Circle.fromSrouce(this);
}

void main() {
  final c = Circle(raduis: 10);

  c.raduis = 15;

  final Circle  a = c.clone();

  print(a.raduis);
}
