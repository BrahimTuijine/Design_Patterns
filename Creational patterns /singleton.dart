class Person {
  String? name;
  String? lastName;

  int age = 10;
  Person._();

  static final _instance = Person._();

  factory Person() => _instance;
}

void main() {
  final person = Person();
  person.name = "brahim";

  final person2 = Person();

  person2.name = "tuijine";

  print(person.name);

  print(person2.name);
}
