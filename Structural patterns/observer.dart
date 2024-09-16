void main(List<String> args) {
  final Observable observable = ObservervableImpl();
  final Observer observer = ObserverImpl();

  observable.setObserver(observer);
  observable.setObserver(observer);
  observable.setObserver(observer);
  observable.removeObserver(observer);
}

abstract class Observer {
  void update(int chnageNumber);
}

class ObserverImpl implements Observer {
  @override
  void update(int chnageNumber) {
    print(chnageNumber);
  }
}

abstract class Observable {
  List<Observer> observers = [];

  void setObserver(Observer observer);

  void removeObserver(Observer observer);

  void notifyObservers();
}

class ObservervableImpl implements Observable {
  int changeNumber = 0;
  @override
  List<Observer> observers = [];

  @override
  void removeObserver(Observer observer) {
    observers.remove(observer);
    changeNumber--;
    notifyObservers();
  }

  @override
  void setObserver(Observer observer) {
    observers.add(observer);
    changeNumber++;
    notifyObservers();
  }

  @override
  void notifyObservers() =>
      observers.forEach((observer) => observer.update(changeNumber));
}
