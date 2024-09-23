abstract interface class AirPortTower {
  void registerAirCraft(AirCraft airCraft);
  void requestLanding(AirCraft airCraft);
  void notifySuccess();
}

abstract interface class AirCraft {
  void requestLanding();
  void notify({required String msg});
  void notifySuccess();
}

class AirBus implements AirCraft {
  final AirPortTower airPortTower;

  AirBus({required this.airPortTower}) {
    airPortTower.registerAirCraft(this);
  }

  @override
  void notify({required String msg}) {
    print('$msg --> AirBus');
  }

  @override
  void notifySuccess() => airPortTower.notifySuccess();

  @override
  void requestLanding() => airPortTower.requestLanding(this);
}

class MiniAirBus implements AirCraft {
  final AirPortTower airPortTower;

  MiniAirBus({required this.airPortTower}) {
    airPortTower.registerAirCraft(this);
  }

  @override
  void notify({required String msg}) {
    print('$msg --> MiniAirBus');
  }

  @override
  void notifySuccess() => airPortTower.notifySuccess();

  @override
  void requestLanding() => airPortTower.requestLanding(this);
}

class TunisairTower implements AirPortTower {
  final String towerName = "TunisairTower";
  final airplanes = <AirCraft>[];
  bool isTerminatorEmpty = true;
  @override
  void notifySuccess() {
    isTerminatorEmpty = true;
    airplanes.forEach((airplane) =>
        airplane.notify(msg: '$towerName : Terninator is Now empty !'));
  }

  @override
  void registerAirCraft(AirCraft airCraft) => airplanes.add(airCraft);

  @override
  void requestLanding(AirCraft airCraft) {
    if (!isTerminatorEmpty) {
      airCraft.notify(msg: "$towerName : The terminal is busy, Please wait.");
    } else {
      airCraft.notify(msg: '$towerName : Ok you can land');
      isTerminatorEmpty = false;
      airplanes.forEach(
        (airplane) {
          if (airplane != airCraft) {
            airplane.notify(msg: '$towerName : An airCraft will land soon');
          }
        },
      );
    }
  }
}
