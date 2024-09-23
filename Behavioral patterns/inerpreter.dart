class StringTokenizer {
  final List<String> _tokens;
  int _index = 0;

  StringTokenizer(String str) : _tokens = str.split(' ');

  String get nextToken =>
      _tokens[_index++]; // Advances the index after returning the token.

  bool get hasMoreTokens => _index < _tokens.length;
}

abstract interface class Expression {
  bool interpret(String context);
}

class TerminalExpression implements Expression {
  final String data;

  TerminalExpression(this.data);

  @override
  bool interpret(String context) {
    final st = StringTokenizer(context);
    while (st.hasMoreTokens) {
      final test = st.nextToken;
      if (test == data) {
        return true; // Return true as soon as a matching token is found.
      }
    }
    return false; // Return false if no match is found after checking all tokens.
  }
}

class AndExpression implements Expression {
  final Expression expr1;
  final Expression expr2;

  AndExpression({
    required this.expr1,
    required this.expr2,
  });

  @override
  bool interpret(String context) =>
      expr1.interpret(context) && expr2.interpret(context);
}

class OrExpression implements Expression {
  final Expression expr1;
  final Expression expr2;

  OrExpression({
    required this.expr1,
    required this.expr2,
  });

  @override
  bool interpret(String context) =>
      expr1.interpret(context) || expr2.interpret(context);
}

class Interpreter {
  Expression buildInterpreterTree() {
    final terminal1 = TerminalExpression("Lions");
    final terminal2 = TerminalExpression("Tigers");
    final terminal3 = TerminalExpression("Bears");

    //Tigers and Bears
    final alternation1 = AndExpression(expr1: terminal2, expr2: terminal3);
    //Lions or (Tigers and Bears)
    final alternation2 = OrExpression(expr1: terminal1, expr2: alternation1);
    //Bears and (Lions or (Tigers and Bears) )
    return AndExpression(expr1: terminal3, expr2: alternation2);
  }
}

void main() {
  final jack = Interpreter().buildInterpreterTree();
  final String context = "Tigers Bears";

  print("$context is jack ${jack.interpret(context)}");
}
