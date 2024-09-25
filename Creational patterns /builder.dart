class House {
  late String address;
  late int floorNumber;
  late bool isHavingParking;
  late bool isHavingGarden;

  House(HouseBuilder houseBuilder) {
    this.address = houseBuilder.address;
    this.floorNumber = houseBuilder.floorNumber;
    this.isHavingParking = houseBuilder.isHavingParking;
    this.isHavingGarden = houseBuilder.isHavingGarden;
  }

  @override
  String toString() {
    return 'House(address: $address, floorNumber: $floorNumber, isHavingParking: $isHavingParking, isHavingGarden: $isHavingGarden)';
  }
}

class HouseBuilder {
  final String address;
  int floorNumber = 0;
  bool isHavingParking = false;
  bool isHavingGarden = false;

  HouseBuilder({required this.address});

  HouseBuilder setFloor(int floorNumber) {
    this.floorNumber = floorNumber;
    return this;
  }

  HouseBuilder makeParking() {
    this.isHavingParking = true;
    return this;
  }

  HouseBuilder makeGarden() {
    this.isHavingGarden = true;
    return this;
  }

  House build() => House(this);
}

void main() {
  final house = HouseBuilder(address: 'el alia')
      .setFloor(3)
      .makeGarden()
      .makeParking()
      .build();

  print(house.toString());
}
