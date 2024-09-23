abstract interface class Book {
  Workers worker;
  final String title;

  Book({required this.worker, required this.title});

  void nextBook();
}

abstract interface class Workers {
  late Book currentBook;

  void getNextBook();
}

class BookOne implements Book {
  @override
  void nextBook() => worker.currentBook = BookTwo(worker: worker);

  @override
  Workers worker;
  BookOne({
    required this.worker,
  });

  @override
  String get title => "book one";
}

class BookTwo implements Book {
  @override
  void nextBook() => worker.currentBook = BookThree(worker: worker);

  @override
  Workers worker;
  BookTwo({
    required this.worker,
  });

  @override
  String get title => "book two";
}

class BookThree implements Book {
  @override
  void nextBook() => worker.currentBook = BookThree(worker: worker);

  @override
  Workers worker;
  BookThree({
    required this.worker,
  });

  @override
  String get title => "book three";
}

class Worker implements Workers {
  @override
  late Book currentBook;

  Worker() {
    currentBook = BookOne(worker: this);
  }

  @override
  void getNextBook() => currentBook.nextBook();
}

void main() {
  final Workers worker = Worker();

  worker.getNextBook();
  worker.getNextBook();
  worker.getNextBook();
  print(worker.currentBook.title);
}
