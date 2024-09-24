enum Platform { android, ios }

abstract interface class Factory {
  CheckBox createCheckbox();
  Button createButton();
}

abstract interface class Button {
  String build();
}

abstract interface class CheckBox {
  String build();
}

class AndroidFactory implements Factory {
  @override
  Button createButton() => AndroidButton();

  @override
  CheckBox createCheckbox() => AndroidCheckBox();
}

class IosFactory implements Factory {
  @override
  Button createButton() => IosButton();

  @override
  CheckBox createCheckbox() => IosCheckBox();
}

class AndroidButton implements Button {
  @override
  String build() => 'android button';
}

class IosButton implements Button {
  @override
  String build() => 'iso button';
}

class AndroidCheckBox implements CheckBox {
  @override
  String build() => 'android checkBox';
}

class IosCheckBox implements CheckBox {
  @override
  String build() => 'ios checkBox';
}

void main() {
  final platform = Platform.ios;

  final Factory fctr = switch (platform) {
    Platform.android => AndroidFactory(),
    _ => IosFactory(),
  };

  final btn = fctr.createButton();

  print(btn.build());

  final chBox = fctr.createCheckbox();

  print(chBox.build());
}
