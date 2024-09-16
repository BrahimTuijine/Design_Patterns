void main(List<String> args) {
  final bilel = Director();
  final ramzi = VP();
  final brahim = CEO();

  bilel.accessor = ramzi;
  ramzi.accessor = brahim;

  Request request = Request(RequestType.conference, 500);

  bilel.handleRequest(request);

  request = Request(RequestType.purchase, 1000);

  ramzi.handleRequest(request);

  request = Request(RequestType.purchase, 5000);

  brahim.handleRequest(request);
}

enum RequestType { conference, purchase }

class Request {
  final RequestType requestType;
  final double amount;

  Request(this.requestType, this.amount);
}

abstract class Handler {
  Handler? accessor;

  Handler({this.accessor});

  void handleRequest(Request request);
}

class Director extends Handler {
  @override
  void handleRequest(Request request) {
    if (request.requestType == RequestType.conference) {
      print("Director can Approve conferences");
    } else {
      accessor?.handleRequest(request);
    }
  }
}

class VP extends Handler {
  @override
  void handleRequest(Request request) {
    if (request.requestType == RequestType.purchase) {
      if (request.amount < 1500) {
        print("VP can Approye budget « 1500");
      }
    } else {
      accessor?.handleRequest(request);
    }
  }
}

class CEO extends Handler {
  @override
  void handleRequest(Request request) {
    print("CEO can Approve Everything");
  }
}
