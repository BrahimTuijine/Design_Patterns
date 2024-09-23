import 'dart:collection';

abstract interface class _Iterator<E> {
  bool hasNext();
  E get next;
}

abstract interface class _Iterable {
  _Iterator getIterator();
}

class QueueIterator<T> implements _Iterator<T> {
  final Queue<T> myQueue;

  QueueIterator({required this.myQueue});

  @override
  bool hasNext() => myQueue.isNotEmpty;

  @override
  T get next => hasNext()
      ? myQueue.removeFirst()
      : throw StateError("No more elements in the queue.");
}

class ListEterator<T> implements _Iterator<T> {
  final List<T> myList;
  int index = 0;

  ListEterator({required this.myList});

  @override
  bool hasNext() => index < myList.length;

  @override
  T get next {
    final tmp = myList[index];
    index++;
    return tmp;
  }
}

class PancakeHouseMenu implements _Iterable {
  final Queue<Menu> menuItems = Queue<Menu>();

  PancakeHouseMenu() {
    menuItems.addAll([
      Menu(
        'Regular Pancake Breakfast',
        "Pancake with fried eggs, sausage",
      ),
      Menu(
        "K&B's Pancake Breakfast",
        "Pancakes with scrambled eggs, and toast",
      ),
    ]);
  }

  @override
  _Iterator getIterator() => QueueIterator<Menu>(myQueue: menuItems);
}

class DinerMenu implements _Iterable {
  final List<Menu> menuItems = <Menu>[];

  DinerMenu() {
    menuItems.addAll([
      Menu(
        "Vegetarian BLT",
        "(Fakin) Bacon with lettuce & tomato on whole wheat",
      ),
      Menu(
        "BLT",
        "Bacon with lettuce & tomato on whole wheat",
      ),
    ]);
  }

  @override
  _Iterator getIterator() => ListEterator(myList: menuItems);
}

class Menu {
  final String title;
  final String description;

  Menu(this.title, this.description);
}

class Waitress {
  final List<_Iterable> myMenus;

  Waitress({required this.myMenus});

  void printMenu() =>
      myMenus.forEach((element) => _waitressPrint(element.getIterator()));

  void _waitressPrint(_Iterator i) {
    while (i.hasNext()) {
      print((i.next as Menu).title);
    }
  }
}

void main() {
  final pancakeHouseMenu = PancakeHouseMenu();
  final dinerMenu = DinerMenu();

  final waitress = Waitress(myMenus: [pancakeHouseMenu, dinerMenu]);

  waitress.printMenu();
}
