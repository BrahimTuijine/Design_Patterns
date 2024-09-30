abstract interface class Widget {
  late String name;
}

class Column implements Widget {
  final List<Widget> children;
  @override
  String name;
  Column({required this.children, required this.name});

  void buildChildren() => children.forEach((widget) => print(widget.name));
}

class Text implements Widget {
  @override
  String name;
  Text({required this.name});
}

class Image implements Widget {
  @override
  String name;
  Image({required this.name});
}

class WebView implements Widget {
  @override
  String name;
  WebView({required this.name});
}

void main() {
  final text = Text(name: 'text widget');

  final image = Image(name: 'image');

  final webView = WebView(name: 'webView');

  final column = Column(children: [text, image, webView], name: 'column');

  column.buildChildren();
}
