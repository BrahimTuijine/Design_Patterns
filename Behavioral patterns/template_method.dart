abstract class MakePizzaAlgorith {
  void bakePizza() => print('Baking pizza ...');

  void definePizzaShape();

  void putAddons() => print("Putting Pizza Addons ...");

  void heatPizza() => print("Heating Pizza ...");

  void makePizza() {
    bakePizza();
    definePizzaShape();
    putAddons();
    heatPizza();
  }
}

class RoundedPizza extends MakePizzaAlgorith {
  @override
  void definePizzaShape() => print('rounded pizza');
}

class RectanglePizza extends MakePizzaAlgorith {
  @override
  void definePizzaShape() => print('Rectangle pizza');
}

void main() {
  final order1 = RoundedPizza();

  order1.makePizza();

  print('-' * 30);

  final order2 = RectanglePizza();

  order2.makePizza();
}
