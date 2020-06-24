part of dartcord;

class MessageCreateEvent extends Event {
  final Message _message;

  MessageCreateEvent(this._message) : super(toCamelCase(Events.messageCreate));

  Message get message => _message;
}
