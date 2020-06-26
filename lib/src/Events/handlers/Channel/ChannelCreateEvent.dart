part of dartcord;

void channelCreateEvent(Client client, Payload payload) {
  client.fire(ChannelCreateEvent(client, payload));
}

class ChannelCreateEvent extends Event {
  final Payload _payload;

  ChannelCreateEvent(Client client, this._payload) : super(toCamelCase(Events.channelCreate), client);

  Payload get payload => _payload;
}
