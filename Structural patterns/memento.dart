abstract interface class Memento<T> {
  T getSnapshot();
}

class MementoImpl implements Memento<String> {
  final String codeFile;

  MementoImpl({required this.codeFile});

  @override
  String getSnapshot() => codeFile;
}

class Originator {
  late String codeFile;

  Originator() {
    this.codeFile = '';
  }

  void addNewLine(String line) => codeFile = '$codeFile\n$line';

  Memento getStateAsMemento() => MementoImpl(codeFile: codeFile);

  void restoreStateFromMemento(Memento memento) =>
      this.codeFile = memento.getSnapshot();

  String get getCodeFile => codeFile;
}

class CareTaker {
  final List<Memento> mementos = [];

  void addMemento(Memento memento) => mementos.add(memento);

  Memento getMemento() => mementos.last;
}

void main() {
  final Originator originator = Originator();

  final CareTaker careTaker = CareTaker();

  originator.addNewLine('hello brahim');

  careTaker.addMemento(originator.getStateAsMemento());

  originator.addNewLine('second hello brahim');

  careTaker.addMemento(originator.getStateAsMemento());

  originator.addNewLine('test test');

  print(careTaker.getMemento().getSnapshot());

  originator.restoreStateFromMemento(careTaker.getMemento());

  print(originator.getCodeFile);
}
