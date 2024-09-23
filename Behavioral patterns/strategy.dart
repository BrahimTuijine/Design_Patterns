abstract interface class Algorithm {
  void performAlgorithm();
}

class Mechanic {
  Algorithm? algorithm;

  void setAlgorithm(Algorithm algo) => algorithm = algo;

  void dissembleCar() => algorithm?.performAlgorithm();
}

class Bmw implements Algorithm {
  @override
  void performAlgorithm() {
    print("Performing Bmw Disassembly Algorithm");
  }
}

class Toyota implements Algorithm {
  @override
  void performAlgorithm() {
    print("Performing Toyota Disassembly Algorithm");
  }
}

void main() {
  final mechanic = Mechanic();

  print("Toyota Car Entered Garage");
  mechanic.setAlgorithm(Toyota());
  mechanic.dissembleCar();

  print("Bmw Car Entered Garage");
  mechanic.setAlgorithm(Bmw());
  mechanic.dissembleCar();
}
