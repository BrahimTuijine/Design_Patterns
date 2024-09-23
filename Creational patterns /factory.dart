enum MessageType { text, voice, image }

abstract class MessageFactory {
  String build(context);

  factory MessageFactory.message({required MessageType msgType}) =>
      switch (msgType) {
        MessageType.text => TextMessage(),
        MessageType.image => ImageMessage(),
        _ => VoiceMessage(),
      };
}

//? these classes can be Stateless Widget

class TextMessage implements MessageFactory {
  @override
  String build(context) => 'this is text message';
}

class ImageMessage implements MessageFactory {
  @override
  String build(context) => 'this is image message';
}

class VoiceMessage implements MessageFactory {
  @override
  String build(context) => 'this voice message';
}
