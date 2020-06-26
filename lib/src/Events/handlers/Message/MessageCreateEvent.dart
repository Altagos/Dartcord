part of dartcord;

void messageCreateEvent(Client client, Payload payload) {
  client.fire(MessageCreateEvent(client, Message.fromMap(payload.d, client)));
}

class MessageCreateEvent extends Event {
  final Message _message;

  MessageCreateEvent(Client client, this._message)
      : super(toCamelCase(Events.messageCreate), client);

  Message get message => _message;
}
