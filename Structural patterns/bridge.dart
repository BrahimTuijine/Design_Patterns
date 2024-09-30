abstract interface class OperationSystem {
  void doOperation();
}

abstract interface class CommunUI {
  void click();
}

class Windows implements OperationSystem {
  @override
  void doOperation() => print("Doing operation on Windows Platform");
}

class Ios implements OperationSystem {
  @override
  void doOperation() => print("Doing operation on IOS Platform");
}

class Button implements CommunUI {
  OperationSystem operationSystem;

  Button({required this.operationSystem});
  @override
  void click() => operationSystem.doOperation();
}

void main() {
  final windows = Windows();

  final button = Button(operationSystem: windows);

  button.click();

  final Ios ios = Ios();
  
  button.operationSystem = ios;

  button.click();
}
