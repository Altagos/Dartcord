part of dartcord;

class MessageCreateEvent extends Event {
  final Message _message;

  MessageCreateEvent(Client client, this._message)
      : super(toCamelCase(Events.messageCreate), client);

  Message get message => _message;
}
