abstract interface class Vehicle {
  void accelerate();

  void pushBreak();

  void soundHorn();
}

class Car extends Vehicle {
  @override
  void accelerate() => print("Car starts moving");

  @override
  void pushBreak() => print("Car stopped");

  @override
  void soundHorn() => print("Beeb Beeb ...");
}

class Bicycle {
  void pedal() => print('Bike start moving');

  void stop() => print('Bike stopped');

  void ringBell() => print('Ring ring ...');
}

class BicycleAdapter implements Vehicle {
  final Bicycle bicycle;

  BicycleAdapter({required this.bicycle});
  @override
  void accelerate() => bicycle.pedal();

  @override
  void pushBreak() => bicycle.stop();

  @override
  void soundHorn() => bicycle.ringBell();
}

void main() {
  void useVicle(Vehicle car) {
    car.accelerate();
    car.soundHorn();
    car.pushBreak();
  }

  final Vehicle tesla = Car();

  final Vehicle bike = BicycleAdapter(bicycle: Bicycle());

  useVicle(tesla);

  print('-' * 30);

  useVicle(bike);
}
