abstract interface class InternetService {
  void accessInternet(Employee employee);
}

class Employee {
  final String name;
  int securityLevel;

  Employee(this.name, this.securityLevel);
}

class Internet implements InternetService {
  @override
  void accessInternet(Employee employee) =>
      print("Granted Internet Permission for ${employee.name}");
}

class InternetProxy implements InternetService {
  InternetProxy();
  @override
  void accessInternet(Employee employee) {
    if (employee.securityLevel > 5) {
      Internet().accessInternet(employee);
    } else {
      print('permission denied');
    }
  }
}

void main() {
  final Employee employee = Employee('brahim', 3);

  final InternetProxy internetProxy = InternetProxy();

  internetProxy.accessInternet(employee);

  employee.securityLevel = 7;

  internetProxy.accessInternet(employee);
}
