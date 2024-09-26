abstract interface class PizzaComponent {
  int cost();
  String pizzaDescription();
}

class BasicPizza implements PizzaComponent {
  @override
  int cost() => 5;

  @override
  String pizzaDescription() => 'Basic pizza ';
}

class ShrimpComponent implements PizzaComponent {
  final PizzaComponent pizza;

  ShrimpComponent({required this.pizza});

  @override
  int cost() => pizza.cost() + 5;

  @override
  String pizzaDescription() => pizza.pizzaDescription() + 'with shrimp ';
}

class StripsComponent implements PizzaComponent {
  final PizzaComponent pizza;

  StripsComponent({required this.pizza});

  @override
  int cost() => pizza.cost() + 6;

  @override
  String pizzaDescription() => pizza.pizzaDescription() + 'with strips';
}

void main() {
  final PizzaComponent pizza = BasicPizza();

  final customPizza = ShrimpComponent(pizza: pizza);

  print(customPizza.cost());

  print(customPizza.pizzaDescription());

  final PizzaComponent pizzaWithStrips = StripsComponent(pizza: customPizza);


  print(pizzaWithStrips.cost());

  print(pizzaWithStrips.pizzaDescription());

}
