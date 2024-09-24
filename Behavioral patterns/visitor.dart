abstract interface class Visitors {
  void visitCompany(Company company);
  void visitFactory(Factory company);
  void visitHouse(House company);
  void visitTaxCollectorCompany(TaxCollectorCompany company);
}

class Visitor implements Visitors {
  @override
  void visitCompany(Company company) => print("Collected Company Taxes");

  @override
  void visitFactory(Factory company) => print("Collected Factory Taxes");

  @override
  void visitHouse(House company) => print("Collected House Taxes");

  @override
  void visitTaxCollectorCompany(TaxCollectorCompany taxCollector) {
    taxCollector.istaxeCollected = true;
    print("All Taxes Collected");
  }
}

abstract interface class TaxHolder {
  void accept(Visitors visitor);
}

class TaxCollectorCompany implements TaxHolder {
  bool istaxeCollected = false;
  final taxHolders = <TaxHolder>[];
  @override
  void accept(Visitors visitor) {
    taxHolders.forEach((taxHolder) => taxHolder.accept(visitor));
    visitor.visitTaxCollectorCompany(this);
  }
}

class Company implements TaxHolder {
  @override
  void accept(Visitors visitor) => visitor.visitCompany(this);
}

class Factory implements TaxHolder {
  @override
  void accept(Visitors visitor) => visitor.visitFactory(this);
}

class House implements TaxHolder {
  @override
  void accept(Visitors visitor) => visitor.visitHouse(this);
}

void main() {
  final Visitor visitor = Visitor();

  final company = Company();
  final fac = Factory();
  final house = House();

  final TaxCollectorCompany taxCollector = TaxCollectorCompany();

  taxCollector.taxHolders.addAll([company, fac, house]);

  taxCollector.accept(visitor);
  print(taxCollector.istaxeCollected);
}
