abstract interface class Command {
  void execute();
}

class SendMoneyCommand implements Command {
  final Receiver receiver;

  SendMoneyCommand({
    required this.receiver,
  });

  @override
  void execute() => receiver.sendMony(500);
}

class SendMoneyToAllCommand implements Command {
  final List<Receiver> receiver;

  SendMoneyToAllCommand({
    required this.receiver,
  });

  @override
  void execute() => receiver.forEach((receiver) => receiver.sendMony(500));
}

class Receiver {
  final int id;
  double _money = 0;

  Receiver(this.id);

  void sendMony(double money) {
    this._money += money;
    print('recieved id $id total money => $money');
  }
}

class Invoker {
  void execute(Command command) => command.execute();
}

void main() {
  final reciver = Receiver(0);

  final sender = Invoker();

  final sendMoneyCommand = SendMoneyCommand(receiver: reciver);

  sender.execute(sendMoneyCommand);

  final reciver1 = Receiver(1);
  final reciver2 = Receiver(2);

  final sendToAll =
      SendMoneyToAllCommand(receiver: [reciver, reciver1, reciver2]);

  sender.execute(sendToAll);
}
